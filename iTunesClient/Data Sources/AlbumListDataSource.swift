//
//  AlbumListDataSource.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/10/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import UIKit

class AlbumListDataSource: NSObject, UITableViewDataSource {

    /// Albums
    private var albums = [Album]()
        
    // MARK - Data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.reuseIdentifier, for: indexPath) as? AlbumCell else {
            fatalError("Unable to dequeue cell from identifier")
        }
        let album = albums[indexPath.row]
        let viewModel = AlbumCellViewModel(album: album)
        cell.configure(with: viewModel)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    // MARK - Helper
    
    func album(at indexPath: IndexPath) -> Album {
        return albums[indexPath.row]
    }
    
    func update(with albums: [Album]) {
        self.albums = albums
    }
}
