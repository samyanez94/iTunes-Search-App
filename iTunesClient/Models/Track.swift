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
    
    /// Track runtime
    let runtime: Int
    
    /// Explicitness
    let explicitness: Explicitness
    
    /// Track number
    let trackNumber: Int
    
    init(id: Int, name: String, censoredName: String, runtime: Int, explicitness: Explicitness, trackNumber: Int) {
        self.id = id
        self.name = name
        self.censoredName = censoredName
        self.runtime = runtime
        self.explicitness = explicitness
        self.trackNumber = trackNumber
    }
}

extension Track {
    convenience init?(from searchResult: SearchResult) {
        guard searchResult.type == .track,
            searchResult.kind == "song",
            let id = searchResult.trackID,
            let name = searchResult.trackName,
            let censoredName = searchResult.trackCensoredName,
            let runtime = searchResult.trackRuntime,
            let explicitness = searchResult.trackExplicitness,
            let trackNumber = searchResult.trackNumber
            else { return nil }
        self.init(
            id: id,
            name: name,
            censoredName: censoredName,
            runtime: runtime,
            explicitness: explicitness,
            trackNumber: trackNumber
         )
    }
}
