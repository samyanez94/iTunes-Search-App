//
//  AlbumCell.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/10/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import UIKit
import SDWebImage

class AlbumCell: UITableViewCell {
    
    /// Reuse identifier
    static let reuseIdentifier = "AlbumCell"
    
    /// Cell height
    static let height: CGFloat = 80
    
    /// Artwork view
    @IBOutlet weak var artworkView: UIImageView!
    
    /// Album title label
    @IBOutlet weak var albumTitleLabel: UILabel!
    
    /// Genre label
    @IBOutlet weak var genreLabel: UILabel!
    
    /// Release date
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    func configure(with viewModel: AlbumCellViewModel) {
        albumTitleLabel.text = viewModel.title
        genreLabel.text = viewModel.genre
        releaseDateLabel.text = viewModel.releaseDate
        artworkView.sd_setImage(with: viewModel.artworkURL, completed: nil)
    }
}
