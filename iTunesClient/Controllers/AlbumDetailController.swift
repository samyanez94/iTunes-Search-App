//
//  AlbumDetailController.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/16/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import UIKit

class AlbumDetailController: UITableViewController {
    
    /// Album
    var album: Album {
        didSet {
            dataSource.update(with: album.songs)
            configure(with: album)
            tableView.reloadData()
        }
    }
    
    /// Data source
    var dataSource = AlbumDetailDataSource()
    
    /// API client
     let client = ItunesClient()

    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumGenreLabel: UILabel!
    @IBOutlet weak var albumReleaseDateLabel: UILabel!
    
    init?(coder: NSCoder, album: Album) {
         self.album = album
         super.init(coder: coder)
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = album.name
        tableView.dataSource = dataSource
        
        configure(with: album)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        client.lookupAlbum(withID: album.id) { result in
            if case let .success(album) = result {
                self.album = album
            }
        }
    }
    
    func configure(with album: Album) {
        let viewModel = AlbumDetailViewModel(album: album)
        albumTitleLabel.text = viewModel.title
        albumGenreLabel.text = viewModel.genre
        albumReleaseDateLabel.text = viewModel.releaseDate
        artworkView.sd_setImage(with: URL(string: viewModel.artworkURL))
    }
}
