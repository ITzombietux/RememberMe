//
//  FriendCell.swift
//  RememberMe
//
//  Created by zombietux on 29/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    @IBOutlet private weak var callingCardImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var phoneNumberLabel: UILabel!
    
    var callingCard: UIImage? {
        didSet {
            callingCardImage.image = callingCard
        }
    }
    
    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    
    var phoneNumber: String? {
        didSet {
            phoneNumberLabel.text = phoneNumber
        }
    }
}
