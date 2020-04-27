//
//  Song.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 5/30/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation

struct Song: Decodable {
    /// Identifier
    let id: Int
    
    /// Name
    let name: String
    
    /// Censored name
    let censoredName: String
    
    /// Track time
    let trackTime: Int
    
    /// Explicitness
    let explicitness: Explicitness
    
    private enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case name = "trackName"
        case censoredName = "trackCensoredName"
        case trackTime = "trackTimeMillis"
        case explicitness = "trackExplicitness"
    }
}
