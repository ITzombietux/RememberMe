//
//  StateController.swift
//  RememberMe
//
//  Created by zombietux on 28/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import Foundation

class StateController {
    
    private (set) var topFriends: [Friend] = StateController.createFriends()
    
    var user = User(name: "흑석동토깽이", aboutMe: "저는 26살 IOS개발자 김민식입니다. 현재는 보안 모듈 엔지니어로 활동 중이고, C/C++로 윈도우 개발도 공부 중입니다.", profileImage: "토끼", phoneNumber: "010 - 5024 - 3129")
    
    func updateFriend(_ friend: Friend) {
        var friendIndex = 0
        for (index, oldFriend) in topFriends.enumerated() {
            if oldFriend == friend {
                friendIndex = index
            }
        }
        topFriends[friendIndex] = friend
    }
}

private extension StateController {
    class func createFriends() -> [Friend] {
        let friend1: Friend = {
            let callingCardImage = "명함1"
            let indroduce = "The tube inside by bicycle tire (inner-tube) got a hole and now I can't ride the bike. It isn't a big hole, so I am going to repair it myself. The only problem is that it takes an extremely long time to find the hole. I usually run my finger around the entire tube looking for it, until I eventually find it. This usually takesN 20-30 minutes. There must be an better alternative. What is an easy way to quickly find a hole in a tire tube?"
            let owner = User(name: "양창섭", aboutMe: "Moderator Pro Tempore on Lifehacks.SE", profileImage: "사진1", phoneNumber: "010-4838-1229")
            return Friend(callingCardImage: callingCardImage, introduce: indroduce, owner: owner)
        }()
       
        let friend2: Friend = {
            let callingCardImage = "명함2"
            let indroduce = "The tube inside by bicycle tire (inner-tube) got a hole and now I can't ride the bike. It isn't a big hole, so I am going to repair it myself. The only problem is that it takes an extremely long time to find the hole. I usually run my finger around the entire tube looking for it, until I eventually find it. This usually takesN 20-30 minutes. There must be an better alternative. What is an easy way to quickly find a hole in a tire tube?"
            let owner = User(name: "원태인", aboutMe: "Moderator Pro Tempore on Lifehacks.SE", profileImage: "사진2", phoneNumber: "010-2677-3129")
            return Friend(callingCardImage: callingCardImage, introduce: indroduce, owner: owner)
        }()
        
        let friend3: Friend = {
            let callingCardImage = "명함3"
            let indroduce = "The tube inside by bicycle tire (inner-tube) got a hole and now I can't ride the bike. It isn't a big hole, so I am going to repair it myself. The only problem is that it takes an extremely long time to find the hole. I usually run my finger around the entire tube looking for it, until I eventually find it. This usually takesN 20-30 minutes. There must be an better alternative. What is an easy way to quickly find a hole in a tire tube?"
            let owner = User(name: "최채흥", aboutMe: "Moderator Pro Tempore on Lifehacks.SE", profileImage: "사진3", phoneNumber: "010-4838-1229")
            return Friend(callingCardImage: callingCardImage, introduce: indroduce, owner: owner)
        }()
        return [friend1, friend2, friend3]
    }
}
