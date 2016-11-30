//
//  CommentWriterData.swift
//  Photostream
//
//  Created by Mounir Ybanez on 30/11/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

protocol CommentWriterData {
    
    var id: String { set get }
    var content: String { set get }
    var timestamp: Double { set get }
    var authorName: String { set get }
    var authorId: String { set get }
    var authorAvatar: String { set get }
}

struct CommentWriterDataItem: CommentWriterData {
    
    var id: String = ""
    var content: String = ""
    var timestamp: Double = 0
    var authorName: String = ""
    var authorId: String = ""
    var authorAvatar: String = ""
}
