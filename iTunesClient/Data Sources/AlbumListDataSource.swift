//
//  AlbumListDataSource.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/10/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import UIKit

class AlbumListDataSource: NSObject, UITableViewDataSource {

    private let albums: [Album]
    
    init(albums: [Album]) {
        self.albums = albums
        super.init()
    }
    
    // MARK - Data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumCell.reuseIdentifier, for: indexPath) as! AlbumCell
        
        let album = albums[indexPath.row]
        let viewModel = AlbumCellViewModel(album: album)
        cell.configure(with: viewModel)
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
}
