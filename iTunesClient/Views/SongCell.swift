//
//  SongCell.swift
//  iTunesClient
//
//  Created by Dan on 04/12/2018.
//  Copyright © 2018 Daniil. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {
    
    static let reuseIdentifier = "SongCell"
    
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var songRuntimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(with viewModel: SongViewModel) {
        songTitleLabel.text = viewModel.title
        songRuntimeLabel.text = viewModel.runtime
    }
    
}
