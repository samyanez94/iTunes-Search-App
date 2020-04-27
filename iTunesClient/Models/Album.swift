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
    /// Identifier
    let id: Int
    
    /// Type
    let type: String
    
    /// Artist name
    let artistName: String
    
    /// Name
    let name: String
    
    /// Censored name
    let censoredName: String
    
    /// Artwork URL
    private let artworkURL100: URL?
    
    /// Explicitness
    let explicitness: Explicitness
    
    /// Number of tracks
    let numberOfTracks: Int
    
    /// Release date
    let releaseDate: Date
    
    /// Primary genre
    let primaryGenre: Genre
    
    /// Songs
    var songs = [Song]()
    
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
