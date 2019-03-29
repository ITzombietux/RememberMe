//
//  Model.swift
//  RememberMe
//
//  Created by zombietux on 28/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import Foundation

struct User {
    let name: String
    let aboutMe: String
    let profileImage: String
    let phoneNumber: String
}

struct Friend {
    let callingCardImage: String
    let introduce: String
    let owner: User
}
