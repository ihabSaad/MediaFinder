//
//  ProfileViewController.swift
//  MediaFinder
//
//  Created by ihab saad on 22/02/2024.
//

import UIKit

protocol PresentPhotoProtocol {
    func sendPhoto(image: UIImage)
}

class ProfileViewController: UIViewController{
//    MARK: - OutLets
    @IBOutlet weak var buttonAddPhoto: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var eamilLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var PasswordLabel: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    
//    MARK: properties
    var userName: String?
    var eamil: String?
    var Location: String?
    var password: String?
    var imgePicker = UIImagePickerController()
    var delegate: PresentPhotoProtocol?
    
//  MARK: -    Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
   
        imageProfile.layer.cornerRadius = 24
       
        
        if let userName = UserDefaults.standard.string(forKey: "userNameTextFields"), let email = UserDefaults.standard.object(forKey: "emailTextFields"), let Location = UserDefaults.standard.object(forKey: "locationTextFields")  , let password = UserDefaults.standard.object(forKey: "passwordTextFields") {
            
            self.LocationLabel.text = Location as? String
            self.PasswordLabel.text = password as? String
            self.eamilLabel.text = email as? String
            self.userNameLabel.text =  userName as? String
        }

   
    }

    @IBAction func butttonAddPhoto(_ sender: Any) {
        imgePicker.delegate = self
        imgePicker.allowsEditing = true
        imgePicker.sourceType = .photoLibrary
        self.present(imgePicker, animated: true)
    }

}

extension ProfileViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate  {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageProfile.image = image
            delegate?.sendPhoto(image: image)
        }
        dismiss(animated: true)
    }
}
