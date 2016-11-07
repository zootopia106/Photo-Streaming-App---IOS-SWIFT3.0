//
//  NewsFeedInteractorInterface.swift
//  Photostream
//
//  Created by Mounir Ybanez on 29/10/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import Foundation

protocol NewsFeedInteractorInterface: class {
    
    var offset: Offset? { set get }
    var output: NewsFeedInteractorOutput? { set get }
    var feedService: NewsFeedService! { set get }
    var postService: PostService! { set get }
    
    init(feedService: NewsFeedService, postService: PostService)
    
    associatedtype Offset
}
