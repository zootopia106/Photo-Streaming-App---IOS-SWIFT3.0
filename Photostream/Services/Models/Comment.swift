//
//  Comment.swift
//  Photostream
//
//  Created by Mounir Ybanez on 06/08/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import Foundation

struct Comment {

    var id: String
    var message: String
    var timestamp: Double
    var userId: String

    init() {
        id = ""
        message = ""
        timestamp = 0
        userId = ""
    }
}

struct CommentList {
    
    var comments: [Comment]
    var users: [String: User]
    
    init() {
        comments = [Comment]()
        users = [String: User]()
    }
}
