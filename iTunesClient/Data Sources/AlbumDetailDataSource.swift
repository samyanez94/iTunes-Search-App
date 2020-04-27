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
    
    /// Tracks
    private var tracks = [Track]()
    
    // MARK - Data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TrackCell.reuseIdentifier, for: indexPath) as? TrackCell else {
            fatalError("Unable to dequeue cell from identifier")
        }
        let track = tracks[indexPath.row]
        let viewModel = TrackViewModel(track: track)
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Tracks" : nil
    }
    
    // MARK - Helper
    
    func track(at indexPath: IndexPath) -> Track {
        return tracks[indexPath.row]
    }
    
    func update(with tracks: [Track]) {
        self.tracks = tracks
    }
}
