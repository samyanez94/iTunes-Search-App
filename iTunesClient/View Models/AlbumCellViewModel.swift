//
//  AlbumCellViewModel.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/10/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation
import UIKit

struct AlbumCellViewModel {
    /// Title
    let title: String
    
    /// Release date
    let releaseDate: String
    
    /// Genre
    let genre: String
    
    /// Artwork URL
    let artworkURL: URL?
}

extension AlbumCellViewModel {
    
    init(album: Album) {
        self.title = album.censoredName
        self.genre = album.genre.rawValue
        self.releaseDate = DateFormatter(format: "MMM dd, yyyy").string(from: album.releaseDate)
        self.artworkURL = album.artworkURL(size: 400)
    }
}
