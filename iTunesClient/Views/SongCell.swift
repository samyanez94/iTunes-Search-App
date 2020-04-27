//
//  SongCell.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/16/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {
    
    /// Reuse identifier
    static let reuseIdentifier = "SongCell"

    /// Title label
    @IBOutlet weak var songTitleLabel: UILabel!
    
    /// Runtime label
    @IBOutlet weak var songRuntimeLabel: UILabel!
    
    func configure(with viewModel: SongViewModel) {
        songTitleLabel.text = viewModel.title
        songRuntimeLabel.text = viewModel.runtime
    }

}
