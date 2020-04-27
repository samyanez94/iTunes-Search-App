//
//  TrackViewModel.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/16/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import Foundation

struct TrackViewModel {
    /// Title
    let title: String
    
    /// Runtime
    let runtime: String
}

extension TrackViewModel {
    init(track: Track) {
        self.title = track.censoredName
        self.runtime = TrackViewModel.runtime(from: track.time)
    }
    
    private static func runtime(from trackTime: Int) -> String {
        let timeInSeconds = trackTime / 1000
        let minutes = Int(timeInSeconds) / 60 % 60
        let seconds = Int(timeInSeconds) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
}
