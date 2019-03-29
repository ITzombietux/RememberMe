//
//  FriendDataSource.swift
//  RememberMe
//
//  Created by zombietux on 29/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import Foundation
import UIKit

class FriendDataSource: NSObject {
    private let friends: [Friend]
    
    init(friends: [Friend]) {
        self.friends = friends
    }
    
    func friend(at indexPath: IndexPath) -> Friend {
        return friends[indexPath.row]
    }
}

extension FriendDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FriendCell.self), for: indexPath) as! FriendCell
        
        let friend = self.friend(at: indexPath)
        cell.callingCard = UIImage(named: friend.callingCardImage)
        cell.name = friend.owner.name
        cell.phoneNumber = friend.owner.phoneNumber
        return cell
    }
}
