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
    
    init(album: Album) {
        self.title = album.censoredName
        self.genre = album.primaryGenre.rawValue
        self.releaseDate = DateFormatter(format: "MMM dd, yyyy").string(from: album.releaseDate)
        self.artworkURL = album.artworkURL(size: 400)
    }
}
