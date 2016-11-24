//
//  HomeModuleExtension.swift
//  Photostream
//
//  Created by Mounir Ybanez on 29/10/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit

extension HomePresenter {
    
    var router: HomeWireframe? {
        return wireframe as? HomeWireframe
    }
    
    func presentPostComposer() {
        router?.showPostComposer(from: view.controller, delegate: self)
    }
}

extension HomePresenter: PostComposerModuleDelegate {
    
    func postComposerDidFinishWriting(with image: UIImage, content: String) {
        guard let presenter: NewsFeedPresenter = wireframe.dependency() else {
            return
        }
        
        router?.showPostUpload(in: presenter.view.controller, delegate: self, image: image, content: content)
    }
    
    func postComposerDidCancelWriting() {
        print("Post composer did cancel writing...")
    }
}

extension HomePresenter: PostUploadModuleDelegate {
    
    func postUploadDidFail(with message: String) {
        print("Home Presenter: post upload did fail ==>", message)
    }
    
    func postUploadDidRetry() {
        print("Home Presenter: post upload did retry")
    }
    
    func postUploadDidSucceed(with post: UploadedPost) {
        guard let presenter: NewsFeedPresenter = wireframe.dependency() else {
            return
        }
        
        if presenter.feedCount > 0 {
            presenter.refreshFeeds()
        } else {
            presenter.initialLoad()
        }
    }
}

extension HomeWireframe {
    
    static var viewController: HomeViewController {
        let sb = UIStoryboard(name: "HomeModuleStoryboard", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "HomeViewController")
        return vc as! HomeViewController
    }
    
    func loadModuleDependency(with controller: UITabBarController) {
        let feedVC = (controller.viewControllers?[0] as? UINavigationController)?.topViewController as! NewsFeedViewController
        _ = NewsFeedWireframe(root: root, view: feedVC)
        dependencies?.append(feedVC.presenter as! HomeModuleDependency)
    }
    
    func showPostComposer(from controller: UIViewController?, delegate: PostComposerModuleDelegate?) {
        guard controller != nil else {
            return
        }
        
        // Assemble Post Composer module
        let postComposerViewController = PostComposerWireframe.createViewController()
        let postComposerWireframe = PostComposerWireframe(root: root, delegate: delegate, view: postComposerViewController)
        let postComposerPresenter = postComposerViewController.presenter as! PostComposerPresenter
        
        // Assemble Photo Capture module
        let photoCaptureViewController = PhotoCaptureWireframe.createViewController()
        let _ = PhotoCaptureWireframe(root: root, delegate: postComposerPresenter, view: photoCaptureViewController)
        
        // Assemble Photo Picker module
        let photoPickerViewController = PhotoPickerWireframe.createViewController()
        let _ = PhotoPickerWireframe(root: root, delegate: nil, view: photoPickerViewController)
        
        // Dependency controllers
        let controllers = [photoPickerViewController, photoCaptureViewController]
        postComposerViewController.setupDependency(with: controllers)
        
        // Instantiate navigation controller
        let postComposerNavController = PostComposerWireframe.createNavigationController()
        postComposerNavController.viewControllers.removeAll()
        postComposerNavController.viewControllers.append(postComposerViewController)
        
        // Present Post Composer module
        postComposerWireframe.present(with: postComposerNavController, from: controller!)
    }
    
    func showPostUpload(in controller: UIViewController?, delegate: PostUploadModuleDelegate?, image: UIImage, content: String) {
        guard controller != nil else {
            return
        }
        
        let vc = PostUploadViewController()
        let wireframe = PostUploadWireframe(root: root, delegate: delegate, view: vc, image: image, content: content)
        wireframe.attach(with: vc, in: controller!)
    }
}
