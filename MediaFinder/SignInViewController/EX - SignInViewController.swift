//
//  EX - SignInViewController.swift
//  MediaFinder
//
//  Created by ihab saad on 07/01/2024.
//

import Foundation
import UIKit


extension SignInViewController {
    func isDataEnteredNotSpace_IsEmpty() -> Bool {
        guard emailTextFields.text?.trimed != "" else {
            showAlart(message: "Please, write your email No't Space and is empty , try Agian")
            return false
        }
        guard passwordTextFields.text?.trimed != "" else {
            showAlart(message: "Please, write your password No't Space and is empty , try Agian")
            return false
        }
            return true
    }
    func checkData(){
        if passsword == passwordTextFields.text && eamil == emailTextFields.text {
            presentHomeVc()
        } else {
            showAlart(message: "Is Data Faild")
        }
    }
    
    func presentHomeVc(){
        let homeTabBar = AppTabBarController( )
        RootRouter.prsentRoot(root: homeTabBar)
    }

    func getDataUserDef(){
        if let email = UserDefaults.standard.object(forKey: "emailTextFields") as? String , let passsword = UserDefaults.standard.object(forKey: "passwordTextFields") as? String {
            self.eamil = email
            self.passsword = passsword
        }
    }
}
