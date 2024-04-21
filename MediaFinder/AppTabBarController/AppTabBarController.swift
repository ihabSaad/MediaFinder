//
//  AppTabBarController.swift
//  MediaFinder
//
//  Created by ihab saad on 20/01/2024.
//

import Foundation
import UIKit


class AppTabBarController: UITabBarController {
    
    
    let button = UIButton.init(type: .custom)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
        setButton()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ChangeRadiusOfTabbar()
    }
    
    func setUpTabBar(){
        let itemHome = AppNavController(rootViewController: HomeViewController())
        let imageHome = UIImage(systemName: "house.circle")
        let selectedHome = UIImage(systemName: "house.circle.fill")
        let itemTabHome = UITabBarItem(title: nil, image: imageHome, selectedImage: selectedHome)
      
        
        let itemprofile = AppNavController(rootViewController: ProfileViewController())
        let imageProfile = UIImage(systemName: "person.crop.circle")
        let selectedProfile = UIImage(systemName: "person.crop.circle.fill")
        let itemTabProfile = UITabBarItem(title: nil, image: imageProfile, selectedImage: selectedProfile)
        
        itemHome.tabBarItem = itemTabHome
        itemprofile.tabBarItem = itemTabProfile
        
        viewControllers = [itemHome, itemprofile]
        
    }
    func SimpleAnnimationWhenSelectItem(item: UITabBarItem) {
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }

        let timeInterval: TimeInterval = 0.5
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 1.7, y: 1.7)
        }
        propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        SimpleAnnimationWhenSelectItem(item: item)
    }
    
    func setButton(){
////        button.setImage(UIImage(named: "Vector10"), for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.setTitleColor(.blue, for: .highlighted)
//        button.frame = CGRect(x: 100, y: 0, width: 44, height: 44)
//        button.backgroundColor = .red
//        button.layer.borderWidth = 4
//        button.layer.borderColor = UIColor.white.cgColor
//        self.view.insertSubview(button, aboveSubview: self.tabBar)
    }
    
    func ChangeHeightOfTabbar(){
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame = tabBar.frame
            tabFrame.size.height = 88

            tabFrame.origin.y = view.frame.size.height - 88
            tabBar.frame = tabFrame
        }
    }
    func ChangeRadiusOfTabbar() {
        tabBar.unselectedItemTintColor = .select2
        tabBar.backgroundColor = .colorApp
        tabBar.tintColor = .white
        tabBar.layer.masksToBounds = false
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 60
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
