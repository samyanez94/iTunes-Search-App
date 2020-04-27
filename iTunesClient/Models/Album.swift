//
//  Album.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 5/30/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation

class Album {
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
    let genre: Genre
    
    /// tracks
    var tracks = [Track]()
    
    init(id: Int, type: String, artistName: String, name: String, censoredName: String, artworkURL100: URL?, explicitness: Explicitness, numberOfTracks: Int, releaseDate: Date, genre: Genre, tracks: [Track] = [Track]()) {
        self.id = id
        self.type = type
        self.artistName = artistName
        self.name = name
        self.censoredName = censoredName
        self.artworkURL100 = artworkURL100
        self.explicitness = explicitness
        self.numberOfTracks = numberOfTracks
        self.releaseDate = releaseDate
        self.genre = genre
        self.tracks = tracks
    }
    
    func artworkURL(size dimension: Int = 100) -> URL? {
        guard dimension > 0, dimension != 100, var url = self.artworkURL100 else { return self.artworkURL100 }
        
        url.deleteLastPathComponent()
        url.appendPathComponent("\(dimension)x\(dimension)bb.jpg")
        
        return url
    }
}

extension Album {
    convenience init?(from searchResult: SearchResult) {
        guard let id = searchResult.collectionID,
            let type = searchResult.collectionType,
            let artistName = searchResult.artistName,
            let name = searchResult.collectionName,
            let censoredName = searchResult.collectionCensoredName,
            let explicitness = searchResult.collectionExplicitness,
            let numberOfTracks = searchResult.numberOfTracks,
            let releaseDate = searchResult.releaseDate,
            let genreString = searchResult.genre,
            let genre = Genre(name: genreString)
            else { return nil }
        self.init(
            id: id,
            type: type,
            artistName:
            artistName,
            name: name,
            censoredName: censoredName,
            artworkURL100: searchResult.artworkURL100,
            explicitness: explicitness,
            numberOfTracks: numberOfTracks,
            releaseDate: releaseDate,
            genre: genre
        )
    }
}
