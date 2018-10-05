/* AppDelegate.swift
   Restaurant
   Lets user place an order from a menu obtained from a local server.
   --------------------------------------------------------------------------
   OpenRestaurant (included in project file) MUST BE RUNNING FOR APP TO WORK.
   --------------------------------------------------------------------------
   Created by Nour Yehia on 9/5/18.
   Copyright © 2018 Nour Yehia. All rights reserved. */

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let temporaryDirectory = NSTemporaryDirectory()
        URLCache.shared = URLCache(memoryCapacity: 25000000, diskCapacity: 50000000, diskPath: temporaryDirectory)
        return true
    }
}
