//
//  ItunesAPIClient.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/17/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation

class ItunesAPIClient {
    let downloader = JSONDownloader()
    
    func searchForArtist(withTerm term: String, completion: @escaping ([Artist], ItunesError?) -> Void) {
        let endpoint = Itunes.search(term: term, mediaType: .music(entity: .musicArtist, attribute: .artistTerm))
        
        let task = downloader.jsonTask(with: endpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion([], error)
                    return
                }
                
                guard let result = json["results"] as? [[String: Any]] else {
                    completion([], .jsonParsingError(message: "JSON data does not contain results"))
                    return
                }
                
                let artist = result.compactMap { Artist(json: $0) }
                
                completion(artist, nil)
            }
        }
        task.resume()
    }
}
