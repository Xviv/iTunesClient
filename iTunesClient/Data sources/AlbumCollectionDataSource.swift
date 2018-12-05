//
//  AlbumCollectionDataSource.swift
//  iTunesClient
//
//  Created by Dan on 04/12/2018.
//  Copyright © 2018 Daniil. All rights reserved.
//

import Foundation
import UIKit

class AlbumCollectionDataSource: NSObject, UICollectionViewDataSource {
    
    var albums: [Album]
    
    let pendingOperations = PendingOperations()
    let collectionView: UICollectionView
    
    init(albums: [Album], collectionView: UICollectionView) {
        self.albums = albums
        self.collectionView = collectionView
        super.init()
    }
    
    // MARK: - Data Source
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let albumCell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.reuseIdentifier, for: indexPath) as! AlbumCell
        
        //Alphabetically sorted array of albums
        let sortedAlbums = sortAlbums(albums)
        
        let album = sortedAlbums[indexPath.row]
        let viewModel = AlbumCellViewModel(album: album)
        
        
        albumCell.configure(with: viewModel)
        
        if album.artworkState == .placeholder {
            downloadArtworkForAlbum(album, atIndexPath: indexPath)
        }
        
        return albumCell
    }
    
    // MARK: - Helper
    
    func album(at indexPath: IndexPath) -> Album {
        let sortedAlbums = sortAlbums(albums)
        
        return sortedAlbums[indexPath.row]
    }
    
    func update(with albums: [Album]) {
        self.albums = albums
    }
    
    func sortAlbums(_ album: [Album]) -> [Album] {
        let sortedAlbums = album.sorted{$0.censoredName < $1.censoredName}
        
        return sortedAlbums
    }
    
    func downloadArtworkForAlbum(_ album: Album, atIndexPath indexPath: IndexPath) {
        if let _ = pendingOperations.downloadsInProgress[indexPath] {
            return
        }
        
        let downloader = ArtworkDownloader(album: album)
        
        downloader.completionBlock = {
            if downloader.isCancelled {
                return
            }
            
            DispatchQueue.main.async {
                self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
                self.collectionView.reloadItems(at: [indexPath])
            }
        }
        
        pendingOperations.downloadsInProgress[indexPath] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
    }
    
    
    
    
}
