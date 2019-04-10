//
//  Model.swift
//  RememberMe
//
//  Created by zombietux on 28/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import Foundation

struct User: Equatable, Codable {
    let name: String
    let aboutMe: String
    let profileImage: String
    let phoneNumber: String
}

struct Friend: Decodable {
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

extension Friend {
    var plistRepresentation: [String: AnyObject] {
        return [
            "callingCardImage" : callingCardImage as AnyObject,
            "introduce" : introduce as AnyObject,
            "owner" : owner as AnyObject
        ]
    }
    
    init(plist: [String: AnyObject]) {
        callingCardImage = plist["callingCardImage"] as! String
        introduce = plist["introduce"] as! String
        owner = plist["owner"] as! User
    }
}

extension User {
    var plistRepresentation: [String: AnyObject] {
        return [
            "name": name as AnyObject,
            "aboutMe": aboutMe as AnyObject,
            "profileImage": profileImage as AnyObject,
            "phoneNumber": phoneNumber as AnyObject
        ]
    }

    init(plist: [String: AnyObject]) {
        name = plist["name"] as! String
        aboutMe = plist["aboutMe"] as! String
        profileImage = plist["profileImage"] as! String
        phoneNumber = plist["phoneNumber"] as! String
    }
}
