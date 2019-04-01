//
//  EditProfileViewController.swift
//  RememberMe
//
//  Created by zombietux on 29/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

protocol EditProfileViewControllerDelegate: class {
    func editProfileViewControllerDidEditProfileInfo(viewController: EditProfileViewController)
}

class EditProfileViewController: UIViewController, Stateful {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var aboutMeTextView: UITextView!
    
    var nameDidChange = false
    var aboutMeDidChange = false
    var stateController: StateController?
    var settingsController: SettingsController?
    weak var delegate: EditProfileViewControllerDelegate?

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, identifier == "Save" else {
            return
        }
        guard let stateController = stateController, let name = nameTextField.text, let aboutMe = aboutMeTextView.text else {
            return
        }
        let oldUser = stateController.user
        stateController.user = User(name: name, aboutMe: aboutMe, profileImage: oldUser.profileImage, phoneNumber: oldUser.phoneNumber)
        nameDidChange = name != oldUser.name
        aboutMeDidChange = aboutMe != oldUser.aboutMe
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "Save" else {
            return true
        }
        guard nameTextField.text?.count == 0 || aboutMeTextView.text?.count == 0 else {
            return true
        }
        let title = "Missing name or about me"
        let message = "Both name and about me need to be present to be able to save your editing"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
        return false
    }
    
    @IBAction func cancel(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

}
