//
//  AlbumCollectionController.swift
//  iTunesClient
//
//  Created by Dan on 04/12/2018.
//  Copyright © 2018 Daniil. All rights reserved.
//

import Foundation
import UIKit

class AlbumCollectionController: UICollectionViewController {
    
    var artist: Artist? {
        didSet {
            self.title = artist?.name
            dataSource.update(with: artist!.albums)
            collectionView.reloadData()
        }
    }
    
    lazy var dataSource: AlbumCollectionDataSource = {
        return AlbumCollectionDataSource(albums: [], collectionView: self.collectionView)
    }()
    
    let client = ItunesAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = dataSource
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbum" {
            let cell = sender as! AlbumCell
            if let selectedIndexPath = collectionView.indexPath(for: cell) {
                let selectedAlbum = dataSource.album(at: selectedIndexPath)
                
                let albumDetailController = segue.destination as! AlbumDetailController
                
                client.lookupAlbum(withId: selectedAlbum.id) { album, error in
                    albumDetailController.album = album
                }
                
            }
        }
    }
}
