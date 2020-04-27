//
//  AlbumDetailViewModel.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/16/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation
import UIKit

struct AlbumDetailViewModel {
    /// Title
    let title: String
    
    /// Release date
    let releaseDate: String
    
    /// Genre
    let genre: String
    
    /// Artwork URL
    let artworkURL: URL?
}

extension AlbumDetailViewModel {
    
    /// Date formatter
    static private var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter
    }
    
    init(album: Album) {
        self.title = album.censoredName
        self.genre = album.primaryGenre.rawValue
        self.releaseDate = AlbumDetailViewModel.formatter.string(from: album.releaseDate)
        self.artworkURL = album.artworkURL(size: 400)
    }
}
