//
//  Artist.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 5/30/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation

class Artist {
    /// Identifier
    let id: Int
    
    /// Type
    let type: String
    
    /// Name
    let name: String
    
    /// Albums
    var albums = [Album]()
    
    init(id: Int, type: String, name: String, albums: [Album] = [Album]()) {
        self.id = id
        self.type = type
        self.name = name
        self.albums = albums
    }
}

extension Artist {
    convenience init?(from searchResult: SearchResult) {
        guard searchResult.type == .artist,
            searchResult.artistType == "Artist",
            let id = searchResult.artistID,
            let type = searchResult.artistType,
            let name = searchResult.artistName else { return nil }
        self.init(id: id, type: type, name: name)
    }
}
