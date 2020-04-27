//
//  ItunesAPIClient.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/17/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation

class ItunesClient: APIClient {
    /// URL Session
    var session = URLSession.shared
    
    /// JSON decoder
    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }
    
    /// Date formatter
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return formatter
    }
    
    func searchForArtist(withTerm term: String, completion: @escaping ((Result<[Artist], APIError>) -> Void)) {
        let endpoint = Itunes.search(term: term, mediaType: .music(entity: .musicArtist, attribute: .artistTerm))
        
        fetch(with: endpoint.request, parse: { data -> [Artist]? in
            return try? self.decoder.decode(SearchResult.Response.self, from: data).results.compactMap { Artist(from: $0) }
        }, completion: completion)
    }
    
    func lookupArtist(withID id: Int, completion: @escaping ((Result<Artist, APIError>) -> Void))  {
        let endpoint = Itunes.lookup(id: id, entity: MusicEntity.album)
                                        
        fetch(with: endpoint.request, parse: { data -> Artist? in
            guard let searchResults = try? self.decoder.decode(SearchResult.Response.self, from: data).results, let searchResult = searchResults.first, let artist = Artist(from: searchResult) else {
                return nil
            }
            artist.albums = searchResults.compactMap { Album(from: $0) }
            return artist
        }, completion: completion)
    }
    
    func lookupAlbum(withID id: Int, completion: @escaping ((Result<Album, APIError>) -> Void))  {
        let endpoint = Itunes.lookup(id: id, entity: MusicEntity.song)
                        
        fetch(with: endpoint.request, parse: { data -> Album? in
            guard let searchResults = try? self.decoder.decode(SearchResult.Response.self, from: data).results, let searchResult = searchResults.first, let album = Album(from: searchResult) else {
                return nil
            }
            album.tracks = searchResults.compactMap { Track(from: $0) }
            return album
        }, completion: completion)
    }
}
