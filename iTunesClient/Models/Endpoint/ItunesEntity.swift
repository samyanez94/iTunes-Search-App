//
//  ItunesEntity.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/17/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation

protocol ItunesEntity: QueryItemProvider {
    var entityName: String { get }
}

extension ItunesEntity {
    var queryItem: URLQueryItem {
        return URLQueryItem(name: "entity", value: entityName)
    }
}

enum MusicEntity: String {
    case musicArtist
    case musicTrack
    case album
    case musicVideo
    case mix
    case song
}

extension MusicEntity: ItunesEntity {
    var entityName: String {
        return self.rawValue
    }
}
