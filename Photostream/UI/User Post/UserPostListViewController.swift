//
//  UserPostListViewController.swift
//  Photostream
//
//  Created by Mounir Ybanez on 06/12/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit

class UserPostListViewController: UserPostGridViewController {

    lazy var prototype: PostListCollectionCell! = PostListCollectionCell()
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter.postCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = PostListCollectionCell.dequeue(from: collectionView, for: indexPath)!
        let item = presenter.post(at: indexPath.section) as? PostListCollectionCellItem
        cell.configure(with: item)
        return cell
    }
    
    override func configureFlowLayout(with size: CGSize) {
        flowLayout.configure(with: size.width, columnCount: 1)
        
        prototype.contentView.bounds.size.width = flowLayout.itemSize.width
    }
    
    override func registerCell() {
        PostListCollectionCell.register(in: collectionView!)
    }
}

extension UserPostListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = presenter.post(at: indexPath.section) as? PostListCollectionCellItem
        prototype.configure(with: item, isPrototype: true)
        let size = CGSize(width: flowLayout.itemSize.width, height: prototype.dynamicHeight)
        return size
    }
}
