//
//  NewsFeedViewController.swift
//  Photostream
//
//  Created by Mounir Ybanez on 16/08/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit
import MONUniformFlowLayout
import DateTools

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var presenter: NewsFeedPresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.refreshFeeds()
    }
}

extension NewsFeedViewController: NewsFeedViewInterface {
    
    var controller: UIViewController? {
        return self
    }

    func reloadView() {
        collectionView.reloadData()
    }

    func showEmptyView() {

    }
    
    func didRefreshFeeds() {
        reloadView()
    }
    
    func didLoadMoreFeeds() {
        reloadView()
    }
    
    func didFetchWithError(message: String) {
        
    }
    
    func didLikeWithError(message: String?) {
        reloadView()
    }
    
    func didUnlikeWithError(message: String?) {
        reloadView()
    }

}
