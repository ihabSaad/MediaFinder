//
//  SignInViewController.swift
//  MediaFinder
//
//  Created by ihab saad on 12/03/2024.
//


import UIKit


class SignInViewController: UIViewController {
    
//    MARK: - Outlets-
    @IBOutlet weak var emailTextFields: UITextField!
    @IBOutlet weak var passwordTextFields: UITextField!
    
    @IBOutlet weak var ViewGradient: UIView!
    //    MARK: - proprties -
    var eamil: String?
    var passsword: String?
    
//    MARK: - loadNip -
    init() {
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
//    MARK: - Life cycle Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        getDataUserDef()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
    }
    
//    MARK: - Action -
    @IBAction func presentHomeVc(_ sender: Any) {
        if isDataEnteredNotSpace_IsEmpty() {
            checkData()
        } else {
           showAlart(message: "Is Data Faild ")
        }
    }
    
//    func presentDataUser(){
//        let profileVc = ProfileViewController()
//        profileVc.userName =
//    }
}
