//
//  AppDelegate.swift
//  CustomHeightPresentationController-Example
//
//  Created by Joe Masilotti on 04/16/2018.
//  Copyright (c) 2018 Masilotti.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
