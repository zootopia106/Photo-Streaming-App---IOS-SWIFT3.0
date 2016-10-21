//
//  LoginInteractorOutput.swift
//  Photostream
//
//  Created by Mounir Ybanez on 04/08/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import Foundation

protocol LoginInteractorOutput: class {

    func loginDidSucceed(_ user: User!)
    func loginDidFail(_ error: AuthenticationServiceError)
}
