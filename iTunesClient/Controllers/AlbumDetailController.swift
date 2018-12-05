//
//  AlbumDetailController.swift
//  iTunesClient
//
//  Created by Dan on 04/12/2018.
//  Copyright © 2018 Daniil. All rights reserved.
//

import UIKit

class AlbumDetailController: UITableViewController {
    
    var album: Album? {
        didSet {
            if let album = album {
                if album.artworkState == .placeholder {
                    self.downloadArtworkForAlbum(album)
                }
                configure(with: album)
                dataSource.update(with: album.songs)
                tableView.reloadData()
            }
        }
    }
    
    var dataSource = AlbumDetailDataSource(songs: [])
    let pendingOperations = PendingOperations()
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumGenreLabel: UILabel!
    @IBOutlet weak var albumReleaseDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
    }
    
    func configure(with album: Album) {
        let viewModel = AlbumDetailViewModel(album: album)
        
        albumImageView.image = viewModel.artwork
        albumTitleLabel.text = viewModel.title
        albumGenreLabel.text = viewModel.genre
        albumReleaseDateLabel.text = viewModel.releaseDate
    }
    
    //MARK: - Helpers
    func downloadArtworkForAlbum(_ album: Album) {
        let downloader = ArtworkDownloader(album: album)
        
        downloader.completionBlock = {
            if downloader.isCancelled {
                return
            }
            print("Done")
            DispatchQueue.main.async {
                self.albumImageView.image = album.artwork
            }
        }
        pendingOperations.downloadQueue.addOperation(downloader)
        
    }
}




















