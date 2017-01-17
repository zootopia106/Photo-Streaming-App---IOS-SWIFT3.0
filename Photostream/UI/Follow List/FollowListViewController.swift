//
//  FollowListViewController.swift
//  Photostream
//
//  Created by Mounir Ybanez on 17/01/2017.
//  Copyright © 2017 Mounir Ybanez. All rights reserved.
//

import UIKit

class FollowListViewController: UITableViewController {

    lazy var emptyView: GhostView! = {
        let view = GhostView()
        view.titleLabel.text = "No users"
        return view
    }()
    
    lazy var refreshView: UIRefreshControl = {
        let view = UIRefreshControl()
        view.addTarget(
            self,
            action: #selector(self.triggerRefresh),
            for: .valueChanged)
        return view
    }()
    
    lazy var loadingView: UIActivityIndicatorView! = {
        let view = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        view.hidesWhenStopped = true
        return view
    }()
    
    var isEmptyViewHidden: Bool = false {
        didSet {
            if isEmptyViewHidden {
                emptyView.frame = tableView.bounds
                tableView.backgroundView = emptyView
                
            } else {
                loadingView.removeFromSuperview()
                tableView.backgroundView = nil
            }
        }
    }
    
    var isLoadingViewHidden: Bool = false {
        didSet {
            if isLoadingViewHidden {
                loadingView.frame = tableView.bounds
                loadingView.startAnimating()
                tableView.backgroundView = loadingView
                
            } else {
                loadingView.stopAnimating()
                loadingView.removeFromSuperview()
                tableView.backgroundView = nil
            }
        }
    }
    
    var isRefreshingViewHidden: Bool = false {
        didSet {
            if refreshView.superview == nil {
                tableView.addSubview(refreshView)
            }
            
            if isRefreshingViewHidden {
                refreshView.endRefreshing()
                
            } else {
                refreshView.beginRefreshing()
            }
        }
    }
    
    var presenter: FollowListModuleInterface!
    
    override func loadView() {
        super.loadView()
        
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        
        FollowListCell.register(in: tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
    
    func triggerRefresh() {
        presenter.refresh()
    }
}

extension FollowListViewController: FollowListScene {
    
    var controller: UIViewController? {
        return self
    }
    
    func reload() {
        tableView.reloadData()
    }
    
    func didRefresh(with error: String?) {
        
    }
    
    func didLoadMore(with error: String?) {
        
    }
    
    func didFollow(with error: String?) {
        
    }
    
    func didUnfollow(with error: String?) {
        
    }
}
