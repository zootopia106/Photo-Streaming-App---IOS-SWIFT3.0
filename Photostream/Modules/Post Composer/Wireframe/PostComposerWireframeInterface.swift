//
//  PostComposerWireframeInterface.swift
//  Photostream
//
//  Created by Mounir Ybanez on 09/11/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit

protocol PostComposerWireframeInterface: class {

    var root: RootWireframeInterface? { set get }
    
    init(root: RootWireframeInterface?, delegate: PostComposerModuleDelegate?, view: PostComposerViewInterface, dependencyConfig: ((PostComposerPresenterInterface) -> Void)?)
    
    func attachRoot(with controller: UIViewController, in window: UIWindow)
    
    func present(with controller: UIViewController?, from: UIViewController?, animated: Bool, completion: (() -> Void)?)
    
    func dismiss(with controller: UIViewController?, animated: Bool, completion: (() -> Void)?)
}
