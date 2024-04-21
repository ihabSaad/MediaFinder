//
//  HomeViewController.swift
//  MediaFinder
//
//  Created by ihab saad on 07/01/2024.
//

import UIKit
import AVKit

class HomeViewController: UIViewController {
  
    
    
    //    MARK:   OutLets  -
    @IBOutlet private weak var nameUserLabel: UILabel!
    @IBOutlet private weak var imageProfile: UIImageView!
    @IBOutlet private weak var SearchBar: UISearchBar!
    @IBOutlet private weak var SegmentedControl: UISegmentedControl!
    @IBOutlet private weak var CollectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView!
    
    var userName: String?
    var segmentControlValue = ""
    var arrData = [Media]()
    
    //   MARK: LoadNib -
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    //    MARK: Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
      if let userName = UserDefaults.standard.object(forKey: "userNameTextFields") as? String {
            self.userName = userName
          nameUserLabel.text = "hello👋🏼 \(userName)"
        }
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        
        let def = UserDefaults.standard
        def.setValue(true, forKey: "isLogdIn")
        
    
        
        registerTableView_CollectionView()
    }
    
    //    MARK: ACtion Func -
    @IBAction func ActionSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            segmentControlValue = ""
        case 1:
            segmentControlValue = "music"
        case 2:
            segmentControlValue = "movie"
        case 3:
            segmentControlValue = "tvShow"
        default:
            segmentControlValue = "all"
        }
        handleSearchProcess()
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
         handleSearchProcess()
     }
     
     func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         handleSearchProcess()
     }
}

extension HomeViewController {
    
//    MARK: handleSearchProcess -
    func handleSearchProcess(){
           guard let searchText = SearchBar.text else {
            print("Error, SearchBarText")
            return
        }
           let convertedSearchText = convertSearchBarText(searchText)
           let baseURL = "https://itunes.apple.com/search?term=\(convertedSearchText)&media=\(segmentControlValue)"
        ApiManger.Shard.getMediaData(baseUrl: baseURL) { DataFaild, arrMedia in
           
            if let DataFaild  {
                print("Error, DataFaild ")
            } else if let arrMedia = arrMedia {
                self.arrData = arrMedia
                self.tableView.reloadData()
                self.CollectionView.reloadData()
            }
        }
    }
    
//    MARK: registerTableView_CollectionView -
    func registerTableView_CollectionView(){
        tableView.register(UINib(nibName: String(describing: AllEveryoneTableViewCell.self), 
            bundle: nil),
            forCellReuseIdentifier: String(describing: AllEveryoneTableViewCell.self))

        CollectionView.register(UINib(nibName: String(describing: MostSearchedCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: MostSearchedCollectionViewCell.self))
        
        tableView.dataSource = self
        tableView.delegate = self
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        SearchBar.delegate = self
        
    }
    
//    MARK: replacingOccurrences -
    private func convertSearchBarText(_ text: String) -> String {
            let convertedText = text.replacingOccurrences(of: " ", with: "+")
            return convertedText
        }
    
//    MARK:  playPreview -
     func playPreview(for media: Media) {
         if let previewUrl = URL(string: media.previewUrl ?? "") {
            let player = AVPlayer(url: previewUrl)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            present(playerViewController, animated: true) {
                playerViewController.player?.play()
            }
        }
    }
}

extension HomeViewController: PresentPhotoProtocol {
    func sendPhoto(image: UIImage) {
        imageProfile.image = image
        
    }
}
