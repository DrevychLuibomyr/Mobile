//
//  AppDelegate.swift
//  Task-two
//
//  Created by Любчик on 9/6/18.
//  Copyright © 2018 Любчик. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static var router = CompositionRoot()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        // Override point for customization after application launch.
        window?.rootViewController = AppDelegate.router.navigationController
        window?.makeKeyAndVisible()
        AppDelegate.router.gotToPhotos()
        return true
    }

}

