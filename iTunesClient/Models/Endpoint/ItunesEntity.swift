//
//  ItunesEntity.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/17/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation

enum ItunesEntity {
    case movie
    case podcast
    case music(MusicEntity)
    case musicVideo
    case audiobook
    case shortFilm
    case tvShow
    case software
    case ebook
    case all
}

enum MusicEntity: String {
    case musicArtist
    case musicTrack
    case album
    case musicVideo
    case mix
    case song
}

extension MusicEntity: CustomStringConvertible {
    var description: String {
        return self.rawValue
    }
}
