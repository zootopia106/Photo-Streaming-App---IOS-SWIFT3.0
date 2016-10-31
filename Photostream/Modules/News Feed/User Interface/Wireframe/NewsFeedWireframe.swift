//
//  NewsFeedWireframe.swift
//  Photostream
//
//  Created by Mounir Ybanez on 17/08/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit

struct NewsFeedWireframe: NewsFeedWireframeInterface {

    weak var newsFeedViewController: NewsFeedViewController!
    var rootWireframe: RootWireframeInterface!
    var newsFeedPresenter: NewsFeedPresenter!

    init() {
        let session = AuthSession()
        let service = NewsFeedServiceProvider(session: session)
        var interactor = NewsFeedInteractor(service: service)
        var presenter = NewsFeedPresenter()
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.wireframe = self

        self.newsFeedPresenter = presenter
    }

    func navigateCommentsInterface(_ shouldComment: Bool) {
        // appWireframe.navigateCommentsModule(newsFeedViewController, shouldComment: shouldComment)
    }
}
