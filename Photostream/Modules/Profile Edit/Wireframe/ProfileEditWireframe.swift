//
//  ProfileEditWireframe.swift
//  Photostream
//
//  Created by Mounir Ybanez on 07/01/2017.
//  Copyright © 2017 Mounir Ybanez. All rights reserved.
//

protocol ProfileEditWireframeInterface: BaseModuleWireframe { }

class ProfileEditWireframe: ProfileEditWireframeInterface {
    
    var root: RootWireframe?
    var style: WireframeStyle!
    
    required init(root: RootWireframe?) {
        self.root = root
    }
}
