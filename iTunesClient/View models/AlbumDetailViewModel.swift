//
//  AlbumDetailViewModel.swift
//  iTunesClient
//
//  Created by Dan on 04/12/2018.
//  Copyright © 2018 Daniil. All rights reserved.
//

import Foundation
import UIKit

struct AlbumDetailViewModel {
    let artwork: UIImage
    let title: String
    let releaseDate: String
    let genre: String
}

extension AlbumDetailViewModel {
    init(album: Album) {
        self.artwork = album.artworkState == .downloaded ? album.artwork! : #imageLiteral(resourceName: "AlbumPlaceholder")
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = "dd MMM, yyyy"
        
        self.releaseDate = formatter.string(from: album.releaseDate)
    }
}
