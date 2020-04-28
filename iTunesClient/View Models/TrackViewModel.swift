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
    
    /// Runtime in milliseconds
    private let runtimeInMilliseconds: Int
    
    /// Runtime
    var runtime: String {
        let runtimeInSeconds = runtimeInMilliseconds / 1000
        let seconds = runtimeInSeconds % 60
        let minutes = runtimeInSeconds / 60 % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    /// Track number
    let trackNumber: String
}

extension TrackViewModel {
    init(track: Track) {
        self.title = track.censoredName
        self.runtimeInMilliseconds = track.runtime
        self.trackNumber = String(track.trackNumber)
    }
}
