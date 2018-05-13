//
//  AppDelegate.swift
//  appChallenge
//
//  Created by Reinaldo Villanueva Javierre on 12/5/18.
//  Copyright © 2018 adidas. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let myWindow = self.window {
            self.appCoordinator = AppCoordinator(window: myWindow)
            self.appCoordinator?.start()
        }
        return true
    }
}

