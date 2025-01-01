//
//  AppDelegate.swift
//  RickAndMorty
//
//  Created by Алексей Олудин on 25.12.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: CharactersViewController())
        window?.makeKeyAndVisible()
        return true
    }
}

