//
//  AlbumCellViewModel.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/10/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation

struct AlbumCellViewModel {
    let title: String
    let releaseDate: String
    let genre: String
}

extension AlbumCellViewModel {
    init(album: Album) {
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        
        formatter.dateFormat = "MM dd, yyyy"
        
        self.releaseDate = formatter.string(from: album.releaseDate)
    }
}
