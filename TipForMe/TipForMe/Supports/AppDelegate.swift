//
//  AppDelegate.swift
//  TipForMe
//
//  Created by Văn Khánh Vương on 17/09/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeVC = HomeViewController()
        let nav = UINavigationController()
        nav.pushViewController(homeVC, animated: true)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }


}

