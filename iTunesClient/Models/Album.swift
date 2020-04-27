//
//  Album.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 5/30/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation
import UIKit

enum AlbumArtworkState {
    case placeholder
    case downloaded
    case failed
}

public enum Explicitness: String, Decodable {
    case explicit
    case cleaned
    case notExplicit
}

class Album: Decodable {
    let id: Int
    let type: String
    let artistName: String
    let name: String
    let censoredName: String
    private let artworkURL100: URL?
    let explicitness: Explicitness
    let numberOfTracks: Int
    let releaseDate: Date
    let primaryGenre: Genre
    var songs: [Song] = []
    
    private enum CodingKeys: String, CodingKey {
        case id = "collectionId"
        case type = "collectionType"
        case artistName = "artistName"
        case name = "collectionName"
        case censoredName = "collectionCensoredName"
        case artworkURL100 = "artworkUrl100"
        case explicitness = "collectionExplicitness"
        case numberOfTracks = "trackCount"
        case releaseDate
        case primaryGenre = "primaryGenreName"
    }
    
    func artworkURL(size dimension: Int = 100) -> URL? {
        guard dimension > 0, dimension != 100, var url = self.artworkURL100 else { return self.artworkURL100 }
        
        url.deleteLastPathComponent()
        url.appendPathComponent("\(dimension)x\(dimension)bb.jpg")
        
        return url
    }
}
