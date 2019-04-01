//
//  TopFriendsViewController.swift
//  RememberMe
//
//  Created by zombietux on 29/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class TopQuestionsViewController: UIViewController, Stateful,  UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var friendsDataSource: FriendDataSource?
    var stateController: StateController?
    var settingsController: SettingsController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = .electricViolet
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let topFriends = stateController?.topFriends else {
            return
        }
        friendsDataSource = FriendDataSource(friends: topFriends)
        tableView.dataSource = friendsDataSource
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let friendViewController = segue.destination as? FriendViewController else {
            return
        }
        passState(to: friendViewController)
        if let indexPath = tableView.indexPathForSelectedRow {
            friendViewController.friend = friendsDataSource?.friend(at: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? FriendCell,
            let scheme = settingsController?.scheme {
            cell.nameColor = scheme.nameColor
            cell.phoneNumberColor = scheme.phoneNumberColor
        }
    }

}
