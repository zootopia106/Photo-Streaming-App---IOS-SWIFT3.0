//
//  AppDependency.swift
//  Photostream
//
//  Created by Mounir Ybanez on 03/08/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit
import FirebaseAuth

class AppDependency: AnyObject {

    var appWireframe: AppWireframe!

    init() {
        self.appWireframe = AppWireframe()
    }

    func attachRootViewControllerInWindow(_ window: UIWindow!) {
        if isOK() {
            let homeWireframe = HomeWireframe()
            homeWireframe.rootWireframe = appWireframe
            homeWireframe.navigateHomeInterfaceFromWindow(window)
        } else {
            let vc = LoginWireframe.createViewController()
            let loginWireframe = LoginWireframe(root: appWireframe, view: vc)
            loginWireframe.attachRoot(with: vc, in: window)
        }
    }

    fileprivate func isOK() -> Bool {
        if let _ = FIRAuth.auth()?.currentUser {
            return true
        } else {
            return false
        }
    }
}
