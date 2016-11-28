//
//  CommentFeedInteractorOutput.swift
//  Photostream
//
//  Created by Mounir Ybanez on 28/11/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import Foundation

protocol CommentFeedInteractorOutput: BaseModuleInteractorOutput {

    func commentFeedDidFetch(with comments: CommentList)
    func commentFeedDidFetch(with error: CommentServiceError)
}
