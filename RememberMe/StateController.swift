//
//  StateController.swift
//  RememberMe
//
//  Created by zombietux on 28/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import Foundation

class StateController {
    
    var user = User(name: "흑석동토깽이", aboutMe: "저는 26살 IOS개발자 김민식입니다. 현재는 보안 모듈 엔지니어로 활동 중이고, C/C++로 윈도우 개발도 공부 중입니다.", profileImage: "토끼", phoneNumber: "010 - 5024 - 3129")
    
    var friend = Friend(
        callingCardImage: "KMS-1",
        introduce: "2019년 5월 프로젝트 때 만난 친구 IOS개발자. 3달 동안 같이 보안 모듈 개발을 했었음.",
        owner: User(name: "김민식", aboutMe: "IOS developer", profileImage: "털보", phoneNumber: "010-5024-3129")
    )
}
