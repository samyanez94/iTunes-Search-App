//
//  TrackCell.swift
//  iTunesClient
//
//  Created by Samuel Yanez on 6/16/18.
//  Copyright © 2018 Samuel Yanez. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {
    
    /// Reuse identifier
    static let reuseIdentifier = "TrackCell"

    /// Title label
    @IBOutlet weak var titleLabel: UILabel!
    
    /// Runtime label
    @IBOutlet weak var runtimeLabel: UILabel!
    
    func configure(with viewModel: TrackViewModel) {
        titleLabel.text = viewModel.title
        runtimeLabel.text = viewModel.runtime
    }

}
