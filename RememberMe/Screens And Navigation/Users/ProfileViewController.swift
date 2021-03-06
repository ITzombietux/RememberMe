//
//  ProfileViewController.swift
//  RememberMe
//
//  Created by zombietux on 29/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, Stateful {
    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var aboutMeLabel: UILabel!
    
    var user: User?
    var stateController: StateController?
    var settingsController: SettingsController?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let user = self.user {
            set(user)
            navigationItem.rightBarButtonItem = nil
        } else if let user = stateController?.user {
            set(user)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let navigationController = segue.destination as? UINavigationController else {
            return
        }
        let destination = navigationController.viewControllers.first
        if let destination = destination as? Stateful {
            passState(to: destination)
        }
        if let destination = destination as? EditProfileViewController {
            destination.delegate = self
        }
    }
    
    private func set(_ user: User) {
        profilePictureImageView.image = UIImage(named: user.profileImage)
        nameLabel.text = user.name
        phoneNumberLabel.text = user.phoneNumber
        aboutMeLabel.text = user.aboutMe
    }
    
    @IBAction func editWasSaved(_ segue: UIStoryboardSegue) {
        guard let editViewController = segue.source as? EditProfileViewController else {
            return
        }
        if editViewController.nameDidChange {
            nameLabel.textColor = UIColor.orange
        }
        if editViewController.aboutMeDidChange {
            aboutMeLabel.textColor = UIColor.orange
        }
    }
    
    @IBAction func editWasCanceled(_ segue: UIStoryboardSegue) {}
}

extension ProfileViewController: EditProfileViewControllerDelegate {
    func editProfileViewControllerDidEditProfileInfo(viewController: EditProfileViewController) {
        nameLabel.textColor = UIColor.orange
        phoneNumberLabel.textColor = UIColor.orange
        aboutMeLabel.textColor = UIColor.orange
    }
}
