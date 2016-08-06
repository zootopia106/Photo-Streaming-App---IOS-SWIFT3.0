//
//  PostService.swift
//  Photostream
//
//  Created by Mounir Ybanez on 06/08/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import Foundation

typealias PostServiceCallback = ([Post]?, NSError?) -> Void

class PostService: AnyObject {

    var source: PostServiceSource!
    
    init(source: PostServiceSource!) {
        self.source = source
    }
    
    func get(offset: UInt, limit: UInt, callback: PostServiceCallback!) {
        get(offset, limit: limit) { (posts, error) in
            callback(posts, error)
        }
    }
}

protocol PostServiceSource: class {
    
    func get(offset: UInt, limit: UInt, callback: PostServiceCallback!)
}
