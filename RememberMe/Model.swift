//
//  Model.swift
//  RememberMe
//
//  Created by zombietux on 28/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import Foundation

struct User: Equatable {
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

extension Friend: Equatable {
    static func == (lhs: Friend, rhs: Friend) -> Bool {
        return
            lhs.callingCardImage == rhs.callingCardImage &&
                lhs.introduce == rhs.introduce &&
                lhs.owner == rhs.owner
    }
}
