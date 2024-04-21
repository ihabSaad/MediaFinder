//
//  RootRouter.swift
//  MediaFinder
//
//  Created by ihab saad on 25/02/2024.
//

import Foundation
import UIKit
class RootRouter {
    
    static func prsentRoot(root: UIViewController){
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        window?.rootViewController = root
        window?.makeKeyAndVisible()
    }
}
