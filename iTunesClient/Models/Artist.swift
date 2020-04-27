//
//  Artist.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 5/30/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation

class Artist: Decodable {
    let id: Int
    let type: String
    let name: String
    var albums: [Album] = []
    
    private enum CodingKeys: String, CodingKey {
        case id = "artistId"
        case type = "artistType"
        case name = "artistName"
    }
}

extension Artist {
    struct Response: Decodable {
        var count: Int
        var artists: [Artist]
        
        private enum CodingKeys: String, CodingKey {
            case count = "resultCount"
            case artists = "results"
        }
    }
}
