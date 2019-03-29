//
//  AppDelegate.swift
//  RememberMe
//
//  Created by zombietux on 28/03/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var stateController = StateController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.setCustomAppearance()
        if let initialViewController = window?.rootViewController as? Stateful {
            initialViewController.stateController = stateController
        }
        return true
    }
}

