//
//  RegistrationWireframe.swift
//  Photostream
//
//  Created by Mounir Ybanez on 13/08/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit

struct RegistrationWireframe: RegistrationWireframeInterface {

    var registrationPresenter: RegistrationPresenterInterface!
    var rootWireframe: RootWireframeInterface?

    init(view: RegistrationViewInterface) {
        var presenter = RegistrationPresenter()
        let service = AuthenticationServiceProvider()
        var interactor = RegistrationInteractor(service: service)
        
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.view = view
        view.presenter = presenter
        
        self.registrationPresenter = presenter
        self.registrationPresenter.wireframe = self
    }
    
    func attachAsRoot(in window: UIWindow) {
        guard let controller = registrationPresenter.view?.controller else {
            return
        }
        
        rootWireframe?.showRoot(with: controller, in: window)
    }
    
    func showErrorAlert(title: String, message: String) {
        guard let controller = registrationPresenter.view?.controller else {
            return
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        controller.present(alert, animated: true, completion: nil)
    }
}
