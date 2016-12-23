//
//  ActivityTableCellItem.swift
//  Photostream
//
//  Created by Mounir Ybanez on 23/12/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import Kingfisher
import DateTools

protocol ActivityTableCellItem {
    
    var displayName: String { set get }
    var avatarUrl: String { set get }
    var timestamp: Double { set get }
    var content: String { get }
}

protocol ActivityTableCellLikeItem: ActivityTableCellItem {
    
    var photoUrl: String { set get }
}

protocol ActivityTableCellPostItem: ActivityTableCellItem {
    
    var photoUrl: String { set get }
}

protocol ActivityTableCellCommentItem: ActivityTableCellItem {
    
    var photoUrl: String { set get }
    var message: String { set get }
}

protocol ActivityTableCellFollowItem: ActivityTableCellItem { }

protocol ActivityTableCellConfig {
    
    var dynamicHeight: CGFloat { get }
    
    func configure(with item: ActivityTableCellLikeItem?, isPrototype: Bool)
    func configure(with item: ActivityTableCellPostItem?, isPrototype: Bool)
    func configure(with item: ActivityTableCellCommentItem?, isPrototype: Bool)
    func configure(with item: ActivityTableCellFollowItem?, isPrototype: Bool)
}

extension ActivityTableCell: ActivityTableCellConfig {
    
    var dynamicHeight: CGFloat {
        return 44
    }
    
    func configure(with item: ActivityTableCellLikeItem?, isPrototype: Bool = false) {
        guard item != nil else {
            return
        }
        
        textLabel?.text = item!.content
    }
    
    func configure(with item: ActivityTableCellPostItem?, isPrototype: Bool = false) {
        guard item != nil else {
            return
        }
        
        textLabel?.text = item!.content
    }
    
    func configure(with item: ActivityTableCellCommentItem?, isPrototype: Bool = false) {
        guard item != nil else {
            return
        }
        
        textLabel?.text = item!.content
    }
    
    func configure(with item: ActivityTableCellFollowItem?, isPrototype: Bool = false) {
        guard item != nil else {
            return
        }
        
        textLabel?.text = item!.content
    }
}
