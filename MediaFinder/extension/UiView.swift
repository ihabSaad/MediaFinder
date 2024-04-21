//
//  UiView.swift
//  MediaFinder
//
//  Created by ihab saad on 11/03/2024.
//

import Foundation
import UIKit

extension UIView {
    
    
 
    
    
    func addViewGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.colorApp.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0,1.01]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y:
                                    0.0, width:
                                    frame.size.width, height: frame.size.height)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    @IBInspectable
    var cornerRadius :CGFloat {
        
        get {
            self.layer.cornerRadius
        } set {
            self.layer.cornerRadius = newValue
        }
    }
}
