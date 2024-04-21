//
//  SignUpViewController.swift
//  MediaFinder
//
//  Created by ihab saad on 06/01/2024.
//

import UIKit

class SignUpViewController: UIViewController {
    
//    MARK: - Outlets -
    @IBOutlet weak var userNameTextFields: UITextField!
    @IBOutlet weak var emailTextFields: UITextField!
    @IBOutlet weak var locationTextFields: UITextField!
    @IBOutlet weak var passwordTextFields: UITextField!
    @IBOutlet weak var locationLabel: UILabel!
    
    //    MARK: - loadNip -
     init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
     required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

//    MARK: - Life Cycle Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addViewGradient() 
        locationTextFields.delegate = self
       
    }
//    MARK: - Action -
    @IBAction func prsentSignInVc(_ sender: Any) {
        if checkDataIsNotSpaceAndIsEmpty() {
            PresentSignIn()
        } else {
            userNameTextFields.text = ""
            emailTextFields.text = ""
            locationTextFields.text = ""
            passwordTextFields.text = ""
            print("is Data faild")
        }
    }
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == locationTextFields {
            let vc = MapKitVc()
            vc.modalPresentationStyle = .overFullScreen
            vc.delegate = self
            present(vc, animated: true)
            
            return false
        } else {
            return true
        }
    }
}

extension SignUpViewController: MessageLocationProtocol {
    func messageProtocol(message: String) {
        locationTextFields.text = "\(message)"
    }
    
    
}
