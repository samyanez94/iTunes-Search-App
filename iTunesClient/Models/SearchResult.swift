//
//  SearchResult.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 4/27/20.
//  Copyright © 2020 Samuel Yanez. All rights reserved.
//

import Foundation

enum WrapperType: String, Decodable {
    case track
    case artist
    case collection
}

public struct SearchResult: Decodable {
    let type: WrapperType
    
    let artistType: String?
    
    let artistID: Int?
        
    let artistName: String?
    
    let genre: String?
    
    let collectionType: String?
    
    let collectionID: Int?
    
    let collectionName: String?
    
    let collectionCensoredName: String?
    
    let collectionExplicitness: Explicitness?
    
    let numberOfTracks: Int?
    
    let artworkURL100: URL?
    
    let releaseDate: Date?
    
    let explicitness: Explicitness?
    
    let kind: String?
    
    let trackID: Int?
    
    let trackName: String?
    
    let trackCensoredName: String?
    
    let trackExplicitness: Explicitness?
    
    let trackRuntime: Int?
    
    let trackNumber: Int?
}

extension SearchResult {
    private enum CodingKeys: String, CodingKey {
        case type = "wrapperType"
        case artistType
        case artistID = "artistId"
        case artistName
        case genre = "primaryGenreName"
        case collectionType
        case collectionID = "collectionId"
        case collectionName
        case collectionCensoredName
        case collectionExplicitness
        case numberOfTracks = "trackCount"
        case artworkURL100 = "artworkUrl100"
        case releaseDate
        case explicitness
        case kind
        case trackID = "trackId"
        case trackName
        case trackCensoredName
        case trackExplicitness
        case trackRuntime = "trackTimeMillis"
        case trackNumber
    }
}

extension SearchResult {
    public struct Response: Decodable {
        let results: [SearchResult]
    }
}
