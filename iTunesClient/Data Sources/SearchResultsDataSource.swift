//
//  SearchResultsDataSource.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 5/30/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import UIKit

class SearchResultsDataSource: NSObject, UITableViewDataSource {
    
    /// Artists
    private var artists = [Artist]()
    
    // MARK: - Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath)
        let artist = artists[indexPath.row]
        cell.textLabel?.text = artist.name
        return cell
    }
    
    // MARK: - Helper Methods
    
    func update(with artists: [Artist]) {
        self.artists = artists
    }
    
    func artist(at indexPath: IndexPath) -> Artist {
        return artists[indexPath.row]
    }
}
