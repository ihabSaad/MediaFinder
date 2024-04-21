//
//  Alart.swift
//  MediaFinder
//
//  Created by ihab saad on 07/01/2024.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlart(message: String ) {
        let alart = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alart.addAction(UIAlertAction(title: "Done", style: .destructive))
        present(alart, animated: true)
    }
}
