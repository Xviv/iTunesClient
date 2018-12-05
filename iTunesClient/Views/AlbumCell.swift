//
//  AlbumCell.swift
//  iTunesClient
//
//  Created by Dan on 04/12/2018.
//  Copyright © 2018 Daniil. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AlbumCell"
    
    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with viewModel: AlbumCellViewModel) {
        artworkView.image = viewModel.artwork
        albumTitleLabel.text = viewModel.title
        genreLabel.text = viewModel.genre
        releaseDateLabel.text = viewModel.releaseDate
    }
    
}














