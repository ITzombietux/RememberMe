//
//  ViewController.swift
//  RememberMe
//
//  Created by zombietux on 28/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController, Stateful {
    
    @IBOutlet weak var callingCardImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    var stateController: StateController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let friend = stateController?.friend else {
            return
        }
        nameLabel.text = friend.owner.name
        phoneNumberLabel.text = friend.owner.phoneNumber
        introduceLabel.text = friend.introduce
        callingCardImage.image = UIImage(named: friend.callingCardImage)
        profileImage.image = UIImage(named: friend.owner.profileImage)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileViewController = segue.destination as? ProfileViewController {
            passState(to: profileViewController)
            profileViewController.user = stateController?.friend.owner
        }
    }
    
    @IBAction func ScheduleTapped(_ sender: UIButton) {
    }
    
    @IBAction func profileTapped(_ sender: UIButton) {
    }
    
}

