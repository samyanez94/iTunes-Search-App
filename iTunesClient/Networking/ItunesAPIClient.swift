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
            return try? self.decoder.decode(Artist.Response.self, from: data).artists
        }, completion: completion)
    }
    
    func lookupArtist(withID id: Int, completion: @escaping ((Result<Artist, APIError>) -> Void))  {
        let endpoint = Itunes.lookup(id: id, entity: MusicEntity.album)
                                
        fetch(with: endpoint.request, parse: { data -> Artist? in
            guard let results = try? self.decoder.decode(Wrapper<Artist, Album>.Response.self, from: data).results, let first = results.first, case let Wrapper.left(artist) = first else {
                return nil
            }
            results[1..<results.count].forEach { result in
                if case let Wrapper.right(album) = result {
                    artist.albums.append(album)
                }
            }
            return artist
        }, completion: completion)
    }
    
    func lookupAlbum(withID id: Int, completion: @escaping ((Result<Album, APIError>) -> Void))  {
        let endpoint = Itunes.lookup(id: id, entity: MusicEntity.song)
                        
        fetch(with: endpoint.request, parse: { data -> Album? in
            guard let results = try? self.decoder.decode(Wrapper<Album, Song>.Response.self, from: data).results, let first = results.first, case let Wrapper.left(album) = first else {
                return nil
            }
            results[1..<results.count].forEach { result in
                if case let Wrapper.right(song) = result {
                    album.songs.append(song)
                }
            }
            return album
        }, completion: completion)
    }
}
