//
//  SongViewModel.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/16/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation

struct SongViewModel {
    /// Title
    let title: String
    
    /// Runtime
    let runtime: String
}

extension SongViewModel {
    init(song: Song) {
        self.title = song.censoredName
        self.runtime = SongViewModel.runtime(from: song.trackTime)
    }
    
    private static func runtime(from trackTime: Int) -> String {
        let timeInSeconds = trackTime / 1000
        let minutes = Int(timeInSeconds) / 60 % 60
        let seconds = Int(timeInSeconds) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
}
