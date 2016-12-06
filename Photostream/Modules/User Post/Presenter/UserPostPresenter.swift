//
//  UserPostPresenter.swift
//  Photostream
//
//  Created by Mounir Ybanez on 06/12/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

protocol UserPostPresenterInterface: BaseModulePresenter, BaseModuleInteractable {
    
    var userId: String! { set get }
    var posts: [UserPostData] { set get }
    var limit: UInt { set get }
}

class UserPostPresenter: UserPostPresenterInterface {

    typealias ModuleInteractor = UserPostInteractorInput
    typealias ModuleView = UserPostScene
    typealias ModuleWireframe = UserPostWireframeInterface
    
    weak var view: ModuleView!
    
    var interactor: ModuleInteractor!
    var wireframe: ModuleWireframe!
    
    var userId: String!
    var posts = [UserPostData]()
    var limit: UInt = 10
}

extension UserPostPresenter: UserPostModuleInterface {
    
    var postCount: Int {
        return posts.count
    }
    
    func exit() {
        var property = WireframeExitProperty()
        property.controller = view.controller
        wireframe.exit(with: property)
    }
    
    func refreshPosts() {
        interactor.fetchNew(with: userId, and: limit)
        if postCount == 0 {
            view.hideEmptyView()
            view.showInitialLoadView()
        }
        view.showRefreshView()
    }
    
    func loadMorePosts() {
        interactor.fetchNext(with: userId, and: limit)
    }
    
    func likePost(at index: Int) {
        guard var post = post(at: index), !post.isLiked else {
            return
        }
        
        post.isLiked = true
        post.likes += 1
        posts[index] = post
        view.reloadView()
        
        interactor.like(post: post.id)
    }
    
    func unlikePost(at index: Int) {
        guard var post = post(at: index), post.isLiked else {
            return
        }
        
        post.isLiked = false
        post.likes -= 1
        posts[index] = post
        view.reloadView()
        
        interactor.unlike(post: post.id)
    }
    
    func post(at index: Int) -> UserPostData? {
        guard posts.isValid(index) else {
            return nil
        }
        
        return posts[index]
    }
}

extension UserPostPresenter: UserPostInteractorOutput {
    
    func userPostDidRefresh(with data: [UserPostData]) {
        
    }
    
    func userPostDidRefresh(with error: PostServiceError) {
        
    }
    
    func userPostDidLoadMore(with data: [UserPostData]) {
        
    }
    
    func userPostDidLoadMore(with error: PostServiceError) {
        
    }
    
    func userPostDidLike(with postId: String, and error: PostServiceError?) {
        
    }
    
    func userPostDidUnlike(with postId: String, and error: PostServiceError?) {
        
    }
}
