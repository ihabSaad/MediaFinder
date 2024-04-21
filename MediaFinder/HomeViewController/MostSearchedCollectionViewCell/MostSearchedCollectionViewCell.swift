//
//  MostSearchedCollectionViewCell.swift
//  MediaFinder
//
//  Created by ihab saad on 15/01/2024.
//

import UIKit

class MostSearchedCollectionViewCell: UICollectionViewCell {
    
//    MARK: Outlets -
    @IBOutlet weak var artworkUrl100Image: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        artworkUrl100Image.layer.cornerRadius = 12
    }
    func configure(with model: Media) {
        trackNameLabel.text = model.trackName
    }

}
