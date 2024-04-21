//
//  CardView.swift
//  MediaFinder
//
//  Created by ihab saad on 07/01/2024.
//

import UIKit

class CardView: UIView {
    
    @IBInspectable var cornerRdis: CGFloat = 8
    @IBInspectable var shadowffsetWight: CGFloat = 2
    @IBInspectable var shadowffsethight: CGFloat = 3
    @IBInspectable var shadowOpacity: CGFloat = 0.2
    @IBInspectable var shadowColor: UIColor = .gray
    @IBInspectable var bordarWight: CGFloat = 0
    @IBInspectable var bordarColor: UIColor?
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRdis
        layer.shadowOffset = CGSize(width: shadowffsetWight, height: shadowffsethight)
        layer.shadowOpacity = Float(shadowOpacity)
        layer.borderColor = bordarColor?.cgColor
        layer.shadowColor = shadowColor.cgColor
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRdis).cgPath
    }
}
