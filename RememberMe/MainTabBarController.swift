//
//  MainTabBarController.swift
//  RememberMe
//
//  Created by zombietux on 29/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, Stateful {
    var stateController: StateController? = StateController()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let viewControllers = viewControllers else {
            return
        }
        for case let navigationController as UINavigationController in viewControllers {
            if let rootViewController = navigationController.viewControllers.first as? Stateful {
                passState(to: rootViewController)
            }
        }
    }
}
