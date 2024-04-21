//
//    EX- HomeVc_TableView.swift
//  MediaFinder
//
//  Created by ihab saad on 15/01/2024.
//

import Foundation
import UIKit
import Kingfisher



extension HomeViewController: UiTableViewDelegate_DataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AllEveryoneTableViewCell.self), for: indexPath) as! AllEveryoneTableViewCell
        
        let model = arrData[indexPath.row]
        let kind = model.kind
        
        let url = URL(string: model.artworkUrl100 ?? "" )
        cell.artworkUrl100Image.kf.setImage(with: url)
        
        if kind == "song" {
            cell.artistNameLabel.text = model.artistName
            cell.mediaTextLabel.text = model.trackName
            cell.mediaInformationTextLabel.text = model.longDescription
            
        } else if kind == "feature-movie" {
            cell.artistNameLabel.text = model.artistName
            cell.trackNameLabel.text = model.trackName
            cell.mediaInformationTextLabel.text = model.longDescription
            
        } else if kind == "tv-episode" {
            cell.artistNameLabel.text = model.artistName
            cell.trackNameLabel.text = model.trackName
            cell.mediaInformationTextLabel.text = model.longDescription
        }
          return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = arrData[indexPath.row]
        playPreview(for: model)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       120
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            
            if indexPath.row == 0 || indexPath.row == 1 {
                cell.transform = CGAffineTransform(translationX: self.view.frame.width, y: 0)
                UIView.animate(withDuration: 1) {
                    cell.transform = .identity
                }
            }
        }
}
