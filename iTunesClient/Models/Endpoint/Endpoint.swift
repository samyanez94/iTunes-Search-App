//
//  Endpoint.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/16/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    /// URL components
    var components: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = queryItems
        
        return components
    }
    
    /// URL request
    var request: URLRequest {
        let url = components.url!
        return URLRequest(url: url)
    }
}

enum Itunes {
    case search(term: String, mediaType: ItunesMedia? = nil)
    case lookup(id: Int, entity: ItunesEntity? = nil)
}

extension Itunes: Endpoint {
    /// Enpoint base
    var base: String {
        return "https://itunes.apple.com"
    }
    
    /// Enpoint path
    var path: String {
        switch self {
        case .search:
            return "/search"
        case .lookup:
            return "/lookup"
        }
    }
    
    /// Endpoint query items
    var queryItems: [URLQueryItem] {
        switch self {
        case .search(let term, let media):
            var result = [URLQueryItem]()
            
            let searchTermItem = URLQueryItem(name: "term", value: term)
            result.append(searchTermItem)
            
            if let media = media {
                let mediaItem = URLQueryItem(name: "media", value: media.description)
                result.append(mediaItem)
                
                if let entityQueryItem = media.entityQueryItem {
                    result.append(entityQueryItem)
                }
                
                if let attributeQueryItem = media.attributeQueryItem {
                    result.append(attributeQueryItem)
                }
            }
            return result
            
        case .lookup(let id, let entity):
            return [
                URLQueryItem(name: "id", value: id.description),
                URLQueryItem(name: "entity", value: entity?.entityName)
            ]
        }
    }
}
