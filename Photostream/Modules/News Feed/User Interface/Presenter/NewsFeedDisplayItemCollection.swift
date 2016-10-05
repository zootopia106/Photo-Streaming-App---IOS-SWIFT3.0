//
//  NewsFeedDisplayItemCollection.swift
//  Photostream
//
//  Created by Mounir Ybanez on 20/08/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import Foundation

struct NewsFeedDisplayItemCollection {

    var items: [NewsFeedDisplayItem]
    var shouldTruncate: Bool
    var count: Int {
        return items.count
    }

    init() {
        items = [NewsFeedDisplayItem]()
        shouldTruncate = false
    }

    mutating func appendContentsOf(_ collection: NewsFeedDisplayItemCollection) {
        if !collection.shouldTruncate {
            items.append(contentsOf: collection.items)
        } else {
            items.removeAll()
            items.append(contentsOf: collection.items)
        }
    }

    mutating func append(_ item: NewsFeedDisplayItem) {
        items.append(item)
    }

    subscript (index: Int) -> NewsFeedDisplayItem? {
        set {
            if let val = newValue , isValid(index) {
                items[index] = val
            }
        }
        get {
            if isValid(index) {
                return items[index]
            }
            return nil
        }
    }

    func isValid(_ index: Int) -> Bool {
        return items.isValid(index)
    }

    func isValid(_ postId: String) -> (Int, Bool) {
        let index = items.index { (item) -> Bool in
            return item.postId == postId
        }
        if let i = index {
            return (i, true)
        } else {
            return (-1, false)
        }
    }
}

struct NewsFeedDisplayItem {

    var userId: String
    var postId: String
    var cellItem: NewsFeedCellDisplayItem
    var headerItem: NewsFeedHeaderDisplayItem

    init() {
        userId = ""
        postId = ""
        cellItem = NewsFeedCellDisplayItem()
        headerItem = NewsFeedHeaderDisplayItem()
    }
}

struct NewsFeedCellDisplayItem {

    var photoUrl: String
    var photoWidth: Int
    var photoHeight: Int
    var isLiked: Bool
    var message: String
    var displayName: String
    var timestamp: Date
    var likesCount: Int64
    var commentsCount: Int64
    var likes: String {
        if likesCount > 0 {
            if likesCount == 1 {
                return "1 like"
            } else {
                return "\(likesCount) likes"
            }
        }

        return ""
    }

    var comments: String {
        if commentsCount > 0 {
            if commentsCount == 1 {
                return "View 1 comment"
            } else {
                if commentsCount > 3 {
                   return "View \(commentsCount) comments"
                } else {
                    return "View all \(commentsCount) comments"
                }
            }
        }

        return ""
    }

    init() {
        photoUrl = ""
        photoWidth = 0
        photoHeight = 0
        likesCount = 0
        commentsCount = 0
        isLiked = false
        message = ""
        displayName = ""
        timestamp = Date()
    }

    mutating func updateLike(_ state: Bool) -> Bool {
        if isLiked != state {
            isLiked = state
            if !isLiked {
                likesCount -= 1
            } else {
                likesCount += 1
            }

            return true
        }

        return false
    }
}

struct NewsFeedHeaderDisplayItem {

    var avatarUrl: String
    var displayName: String

    init() {
        avatarUrl = ""
        displayName = ""
    }
}
