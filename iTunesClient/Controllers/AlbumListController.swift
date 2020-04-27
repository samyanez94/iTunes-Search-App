//
//  AlbumListController.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/10/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import UIKit

class AlbumListController: UITableViewController {
    
    /// Artist
    var artist: Artist {
        didSet {
            dataSource.update(with: artist.albums)
            tableView.reloadData()
        }
    }
    
    /// Data source
    let dataSource = AlbumListDataSource()
    
    /// API client
    let client = ItunesClient()
    
    init?(coder: NSCoder, artist: Artist) {
        self.artist = artist
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = artist.name
        tableView.dataSource = dataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        client.lookupArtist(withID: artist.id) { result in
            if case let .success(artist) = result {
                artist.albums.sort { $0.releaseDate > $1.releaseDate }
                self.artist = artist
            }
        }
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AlbumCell.height
    }
    
    // MARK: - Navigation
    
    @IBSegueAction
     func makeAlbumDetailController(coder: NSCoder) -> AlbumDetailController? {
         guard let indexPath = tableView.indexPathForSelectedRow else { return  nil }
         let album = dataSource.album(at: indexPath)
         return AlbumDetailController(coder: coder, album: album)
     }
}
