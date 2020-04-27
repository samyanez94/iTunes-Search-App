//
//  SearchResultsController.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 5/30/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController {
    
    /// Search controller
    let searchController = UISearchController(searchResultsController: nil)
    
    /// Data source
    let dataSource = SearchResultsDataSource()
    
    /// API client
    let client = ItunesClient()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchResultsController.dismissSearchResultController))
        
        tableView.dataSource = dataSource
        tableView.tableHeaderView = searchController.searchBar

        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        
        definesPresentationContext = true
    }
    
    @objc func dismissSearchResultController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Navigation
    
    @IBSegueAction
    func makeAlbumListController(coder: NSCoder) -> AlbumListController? {
        guard let indexPath = tableView.indexPathForSelectedRow else { return  nil }
        let artist = dataSource.artist(at: indexPath)
        return AlbumListController(coder: coder, artist: artist)
    }
}

// MARK: - UISearchResultsUpdating

extension SearchResultsController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let term = searchController.searchBar.text else { return }
        client.searchForArtist(withTerm: term) { [weak self] result in
            if case let .success(artists) = result {
                self?.dataSource.update(with: artists)
                self?.tableView.reloadData()
            }
        }
    }
}
