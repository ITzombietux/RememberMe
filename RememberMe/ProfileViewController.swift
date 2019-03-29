//
//  ProfileViewController.swift
//  RememberMe
//
//  Created by zombietux on 29/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var aboutMeLabel: UILabel!
    
    fileprivate let stateController = StateController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let user = stateController.user
        profilePictureImageView.image = UIImage(named: user.profileImage)
        nameLabel.text = user.name
        phoneNumberLabel.text = user.phoneNumber
        aboutMeLabel.text = user.aboutMe
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditProfileViewController {
            destination.stateController = stateController
        }
    }
}
