//
//  EX- HomeVc_CollectionView.swift
//  MediaFinder
//
//  Created by ihab saad on 15/01/2024.
//

import Foundation
import UIKit
import Kingfisher

extension HomeViewController:UicollectionViewDelegate_DataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MostSearchedCollectionViewCell.self), for: indexPath) as! MostSearchedCollectionViewCell
        
        let model = arrData[indexPath.row]
        let url = URL(string: model.artworkUrl100 ?? "" )
        cell.artworkUrl100Image.kf.setImage(with: url)
        cell.trackNameLabel.text = model.trackName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 300, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = arrData[indexPath.row]
        playPreview(for: model)
    }
//     func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//
//        cell.alpha = 0
//        cell.layer.transform = CATransform3DMakeRotation(10, 1, 1, 0)
//        UIView.animate(withDuration: 1.0, delay: 1.0*Double(indexPath.row),animations: { () -> Void in
//        cell.alpha = 1
//
//            cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
//        })
//    }
     func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        UIView.animate(withDuration: 1.0, animations: { () -> Void in
            cell.alpha = 1
            cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
        })
    }
}
