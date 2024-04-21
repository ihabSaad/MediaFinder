//
//  AllEveryoneTableViewCell.swift
//  MediaFinder
//
//  Created by ihab saad on 15/01/2024.
//

import UIKit

class AllEveryoneTableViewCell: UITableViewCell {
    
//    MARK: Outlets -
    @IBOutlet weak var artworkUrl100Image: UIImageView!
    @IBOutlet weak var mediaTextLabel: UILabel!
    @IBOutlet weak var mediaInformationTextLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        artworkUrl100Image.layer.cornerRadius = 12
    }
    
    func configure(with model: Media) {
        mediaInformationTextLabel.text = model.longDescription
        mediaTextLabel.text = model.trackName
        artistNameLabel.text = model.artistName
        trackNameLabel.text = model.trackName
        
    }

    
}
