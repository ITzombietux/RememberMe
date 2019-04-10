//
//  StorageController.swift
//  RememberMe
//
//  Created by zombietux on 01/04/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import Foundation

class StorageController {
    
    private let documentsDirectoryURL = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask)
        .first!
    
    private var userFileURL: URL {
        return documentsDirectoryURL
            .appendingPathComponent("User")
            .appendingPathExtension("plist")
    }
    
    func fetchTopFriends() -> [Friend]? {
        guard let dataFileURL = Bundle.main.url(forResource: "Data", withExtension: "plist"),
            let plistData = try? Data(contentsOf: dataFileURL) else {
                return nil
        }
        let decoder = PropertyListDecoder()
        return try? decoder.decode([Friend].self, from: plistData)
    }
    
    func save(_ user: User) {
        let encoder = PropertyListEncoder()
        if let data = try? encoder.encode(user) {
            try? data.write(to: userFileURL)
        }
    }
    
    func fetchUser() -> User {
        let defaultUser = User(name: "흑석동토꺵이", aboutMe: "저는 26살 IOS개발자 김민식입니다. 현재는 보안 모듈 엔지니어로 활동 중이고, C/C++로 윈도우 개발도 공부 중입니다.", profileImage: "토끼", phoneNumber: "010-5024-3129")
        guard let plistData = try? Data(contentsOf: userFileURL) else {
            return defaultUser
        }
        let decoder = PropertyListDecoder()
        return (try? decoder.decode(User.self, from: plistData)) ?? defaultUser
    }
}
