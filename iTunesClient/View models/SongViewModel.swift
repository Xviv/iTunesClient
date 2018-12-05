//
//  SongViewModel.swift
//  iTunesClient
//
//  Created by Dan on 04/12/2018.
//  Copyright © 2018 Daniil. All rights reserved.
//
import Foundation

struct SongViewModel {
    let title: String
    let runtime: String
}

extension SongViewModel {
    init(song: Song) {
        self.title = song.censoredName
        
        // Track time in milliseconds
        let timeInSeconds = song.trackTime/1000
        let minutes = timeInSeconds/60 % 60
        let seconds = timeInSeconds % 60
        if seconds < 10 {
            self.runtime = "\(minutes) : 0\(seconds)"
        } else {
            self.runtime = "\(minutes) : \(seconds)"
        }
    }
}





















