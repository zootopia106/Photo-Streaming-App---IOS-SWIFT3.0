//
//  CommentFeedInteractorInterface.swift
//  Photostream
//
//  Created by Mounir Ybanez on 28/11/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import Foundation

protocol CommentFeedInteractorInterface: BaseModuleInteractor {

    var service: CommentService! { set get }
    
    init(service: CommentService)
}
