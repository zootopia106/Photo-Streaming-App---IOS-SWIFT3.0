//
//  ProfileEditModule.swift
//  Photostream
//
//  Created by Mounir Ybanez on 07/01/2017.
//  Copyright © 2017 Mounir Ybanez. All rights reserved.
//

import UIKit

protocol ProfileEditModuleInterface: BaseModuleInterface {
    
    func uploadAvatar(with image: UIImage)
    func updateProfile()
    
    func set(username: String)
    func set(bio: String)
    func set(firstName: String)
    func set(lastName: String)
}
