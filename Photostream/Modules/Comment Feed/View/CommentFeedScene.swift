//
//  CommentFeedScene.swift
//  Photostream
//
//  Created by Mounir Ybanez on 28/11/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

protocol CommentFeedScene: BaseModuleView {

    var presenter: CommentFeedModuleInterface! { set get }
    
    func reload()
    func showEmptyView()
    func showInitialLoadView()
    func hideEmptyView()
    func hideInitialLoadView()
    
    func didRefreshComments(with error: String?)
    func didLoadMoreComments(with error: String?)
}
