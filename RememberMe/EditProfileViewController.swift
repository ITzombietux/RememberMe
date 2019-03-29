//
//  EditProfileViewController.swift
//  RememberMe
//
//  Created by zombietux on 29/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var aboutMeTextView: UITextView!
    
    var stateController: StateController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let borderColor: UIColor = UIColor(named: "Gray Chateau") ?? .brown
        nameTextField.layer.borderColor = borderColor.cgColor
        aboutMeTextView.layer.borderColor = borderColor.cgColor
        
        nameTextField.layer.borderWidth = 1.0
        aboutMeTextView.layer.borderWidth = 1.0

        let user = stateController?.user
        nameTextField.text = user?.name
        aboutMeTextView.text = user?.aboutMe

    }
    
    @IBAction func save(_ sender: AnyObject) {
        if let stateController = stateController, let name = nameTextField.text, let aboutMe = aboutMeTextView.text,
            !name.isEmpty && !aboutMe.isEmpty {
            let oldUser = stateController.user
            stateController.user = User(name: name, aboutMe: aboutMe, profileImage: oldUser.profileImage, phoneNumber: oldUser.phoneNumber)
            dismiss(animated: true, completion: nil)
        } else {
            let title = "Missing name or about me"
            let message = "Both name and about me need to be present to be able to save your editing"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancel(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

}
