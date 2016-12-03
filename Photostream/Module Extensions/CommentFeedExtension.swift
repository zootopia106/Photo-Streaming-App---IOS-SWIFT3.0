//
//  CommentFeedExtension.swift
//  Photostream
//
//  Created by Mounir Ybanez on 29/11/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import DateTools

extension CommentFeedModule {
    
    convenience init() {
        self.init(view: CommentFeedViewController())
    }
}

extension CommentFeedDataItem: CommentListCellItem { }

extension CommentFeedScene {
    
    func adjust(bottomInset: CGFloat) {
        guard let view = controller?.view as? UITableView else {
            return
        }
        
        view.scrollIndicatorInsets.bottom += bottomInset
        view.contentInset.bottom += bottomInset
    }
}
