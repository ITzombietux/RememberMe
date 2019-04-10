//
//  ViewController.swift
//  RememberMe
//
//  Created by zombietux on 28/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class FriendViewController: UITableViewController, Stateful {
    
    @IBOutlet weak var callingCardImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    var stateController: StateController?
    var settingsController: SettingsController?
    var friend: Friend?
    
    var introduceColor: UIColor? {
        didSet {
            introduceLabel.textColor = introduceColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let friend = friend else {
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
            profileViewController.user = friend?.owner
        }
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let scheme = settingsController?.scheme else {
            return
        }
        phoneNumberLabel.textColor = scheme.phoneNumberColor
        introduceLabel.textColor = scheme.introduceColor
        nameLabel.textColor = scheme.nameColor
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    @IBAction func ScheduleTapped(_ sender: UIButton) {
    }
    
    @IBAction func profileTapped(_ sender: UIButton) {
    }
    
}

