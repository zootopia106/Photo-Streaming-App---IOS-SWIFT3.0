//
//  AppDelegate.swift
//  Photostream
//
//  Created by Mounir Ybanez on 02/08/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        FIRApp.configure()

        let dependency = AppDependency()
        dependency.attachRootViewControllerInWindow(window)

        return true
    }
}
