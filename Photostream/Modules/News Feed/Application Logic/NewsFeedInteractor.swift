//
//  NewsFeedInteractor.swift
//  Photostream
//
//  Created by Mounir Ybanez on 06/08/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import Foundation

class NewsFeedInteractor: NewsFeedInteractorInput {

    var output: NewsFeedInteractorOutput!
    var service: PostService!
    
    init(service: PostService!) {
        self.service = service
    }
    
    func fetch(userId: String!, offset: UInt! = 0, limit: UInt! = 10) {
        service.get(userId, offset: offset, limit: limit) { (feed, error) in
            if error != nil {
                self.output.newsFeedDidFetch(feed)
            } else {
                self.output.newsFeedDidFetchWithError(error)
            }
        }
    }
}
