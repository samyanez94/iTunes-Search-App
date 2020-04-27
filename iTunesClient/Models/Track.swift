//
//  Track.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 5/30/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation

class Track {
    /// Identifier
    let id: Int
    
    /// Name
    let name: String
    
    /// Censored name
    let censoredName: String
    
    /// Track time
    let time: Int
    
    /// Explicitness
    let explicitness: Explicitness
    
    init(id: Int, name: String, censoredName: String, time: Int, explicitness: Explicitness) {
        self.id = id
        self.name = name
        self.censoredName = censoredName
        self.time = time
        self.explicitness = explicitness
    }
}

extension Track {
    convenience init?(from searchResult: SearchResult) {
        guard let id = searchResult.trackID,
            let name = searchResult.trackName,
            let censoredName = searchResult.trackCensoredName,
            let time = searchResult.trackTime,
            let explicitness = searchResult.trackExplicitness
            else { return nil }
        self.init(
            id: id,
            name: name,
            censoredName: censoredName,
            time: time,
            explicitness: explicitness
         )
    }
}
