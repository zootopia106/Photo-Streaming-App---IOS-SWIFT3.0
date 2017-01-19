//
//  LikedPostWireframe.swift
//  Photostream
//
//  Created by Mounir Ybanez on 19/01/2017.
//  Copyright © 2017 Mounir Ybanez. All rights reserved.
//

protocol LikedPostWireframeInterface: BaseModuleWireframe { }

class LikedPostWireframe: LikedPostWireframeInterface {
    
    var root: RootWireframe?
    var style: WireframeStyle!
    
    required init(root: RootWireframe?) {
        self.root = root
    }
}
