//
//  SearchResultsController.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 5/30/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    let dataSource = SearchResultsDataSource()
    let client = ItunesClient()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchResultsController.dismissSearchResultController))
        
        tableView.tableHeaderView = searchController.searchBar
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        
        tableView.dataSource = dataSource
        definesPresentationContext = true
    }
    
    @objc func dismissSearchResultController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAlbums" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let artist = dataSource.artist(at: indexPath)
                let albumListController = segue.destination as! AlbumListController
                
                client.lookupArtist(withID: artist.id) { result in
                    if let artist = try? result.get() {
                        albumListController.artist = artist
                    }
                }
            }
        }
    }
}

extension SearchResultsController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        client.searchForArtist(withTerm: searchController.searchBar.text!) { [weak self] result in
            if let artists = try? result.get() {
                self?.dataSource.update(with: artists)
                self?.tableView.reloadData()
            }
        }
    }
}
