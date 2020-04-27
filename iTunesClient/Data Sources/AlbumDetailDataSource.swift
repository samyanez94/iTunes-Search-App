//
//  AlbumDetailDataSource.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/16/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation
import UIKit

class AlbumDetailDataSource: NSObject, UITableViewDataSource {
    
    /// Songs
    private var songs = [Song]()
    
    // MARK - Data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SongCell.reuseIdentifier, for: indexPath) as? SongCell else {
            fatalError("Unable to dequeue cell from identifier")
        }
        let song = songs[indexPath.row]
        let viewModel = SongViewModel(song: song)
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Tracks"
        } else {
            return nil
        }
    }
    
    // MARK - Helper
    
    func song(at indexPath: IndexPath) -> Song {
        return songs[indexPath.row]
    }
    
    func update(with songs: [Song]) {
        self.songs = songs
    }
}
