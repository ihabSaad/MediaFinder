//
//  EX - SignUpViewController.swift
//  MediaFinder
//
//  Created by ihab saad on 07/01/2024.
//

import Foundation
import UIKit


extension SignUpViewController {
    func checkDataIsNotSpaceAndIsEmpty() -> Bool {
        
        guard userNameTextFields.text?.trimed != "" else {
            showAlart(message: "Please, write your userName No't Space and is empty , try Agian")
            return false
        }
        guard emailTextFields.text?.trimed != "" else {
            showAlart(message: "Please, write your email No't Space and is empty , try Agian")
            return false
        }
        guard locationTextFields.text?.trimed != "" else {
            showAlart(message: "Please, write your location No't Space and is empty , try Agian")
            return false
        }
        guard passwordTextFields.text?.trimed != "" else {
            showAlart(message: "Please, write your password No't Space and is empty , try Agian")
            return false
        }
            return true
    }
    
    func PresentSignIn(){
        let signInVc = SignInViewController()
            saveDataUserDefaults()
        let nav = UINavigationController(rootViewController: signInVc)
        RootRouter.prsentRoot(root: nav)
    }
    
    func saveDataUserDefaults(){
        let UserDef = UserDefaults.standard
            UserDef.set(userNameTextFields.text, forKey: "userNameTextFields")
            UserDef.set(emailTextFields.text, forKey: "emailTextFields")
            UserDef.set(locationTextFields.text, forKey: "locationTextFields")
            UserDef.set(passwordTextFields.text, forKey: "passwordTextFields")
    }
}

