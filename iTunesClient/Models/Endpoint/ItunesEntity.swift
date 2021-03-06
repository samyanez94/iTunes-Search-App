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
    /// Query item
    var queryItem: URLQueryItem {
        return URLQueryItem(name: "entity", value: entityName)
    }
}

enum MovieEntity: String, ItunesEntity {
    case movieArtist
    case movie
    
    /// Entity name
    var entityName: String {
        return self.rawValue
    }
}

enum PodcastEntity: String, ItunesEntity {
    case podcastAuthor
    case podcast
    
    /// Entity name
    var entityName: String {
        return self.rawValue
    }
}

enum MusicEntity: String, ItunesEntity {
    case musicArtist
    case musicTrack
    case album
    case musicVideo
    case mix
    case song
    
    /// Entity name
    var entityName: String {
        return self.rawValue
    }
}

enum MusicVideoEntity: String, ItunesEntity {
    case musicArtist
    case musicVideo
    
    /// Entity name
    var entityName: String {
        return self.rawValue
    }
}

enum AudiobookEntity: String, ItunesEntity {
    case audiobookAuthor
    case audiobook
    
    /// Entity name
    var entityName: String {
        return self.rawValue
    }
}

enum ShortFilmEntity: String, ItunesEntity {
    case shortFilmArtist
    case shortFilm
    
    /// Entity name
    var entityName: String {
        return self.rawValue
    }
}

enum TVShowEntity: String, ItunesEntity {
    case tvEpisode
    case tvSeason
    
    /// Entity name
    var entityName: String {
        return self.rawValue
    }
}

enum SoftwareEntity: String, ItunesEntity {
    case software
    case iPadSoftware
    case macSoftware
    
    /// Entity name
    var entityName: String {
        return self.rawValue
    }
}

enum EbookEntity: String, ItunesEntity {
    case ebook
    
    /// Entity name
    var entityName: String {
        return self.rawValue
    }
}

enum AllEntity: String, ItunesEntity {
    case movie
    case album
    case allArtist
    case podcast
    case musicVideo
    case mix
    case audiobook
    case tvSeason
    case allTrack
    
    /// Entity name
    var entityName: String {
        return self.rawValue
    }
}
