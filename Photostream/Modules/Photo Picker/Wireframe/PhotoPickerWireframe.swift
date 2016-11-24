//
//  PhotoPickerWireframe.swift
//  Photostream
//
//  Created by Mounir Ybanez on 11/11/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit

class PhotoPickerWireframe: PhotoPickerWireframeInterface {

    var root: RootWireframeInterface?
    
    required init(root: RootWireframeInterface?, delegate: PhotoPickerModuleDelegate?, view: PhotoPickerViewInterface) {
        self.root = root
        
        let service = AssetServiceProvider()
        let interactor = PhotoPickerInteractor(service: service)
        let presenter = PhotoPickerPresenter()
        
        interactor.output = presenter
        view.presenter = presenter
        presenter.moduleDelegate = delegate
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = self
    }
    
    func attachRoot(with controller: UIViewController, in window: UIWindow) {
        root?.showRoot(with: controller, in: window)
    }
    
    func present(with controller: UIViewController?, from parent: UIViewController?, animated: Bool, completion: (() -> Void)?) {
        guard controller != nil, parent != nil else {
            return
        }
        
        parent!.present(controller!, animated: animated, completion: completion)
    }
    
    func dismiss(with controller: UIViewController?, animated: Bool, completion: (() -> Void)?) {
        guard controller != nil else {
            return
        }
        
        controller!.dismiss(animated: animated, completion: completion)
    }
}
