//
//  NewsFeedDataSource.swift
//  Photostream
//
//  Created by Mounir Ybanez on 01/11/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit

extension NewsFeedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter.feedCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = presenter.feed(at: indexPath.section)
        
        switch item {
        case let post as NewsFeedPost?:
            return cell(from: collectionView, at: indexPath, for: post)
        
        case let ad as NewsFeedAd?:
            return cell(from: collectionView, at: indexPath, for: ad)
            
        default:
            break
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let item = presenter.feed(at: indexPath.section)
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            return header(from: collectionView, at: indexPath, for: item as! NewsFeedPost?)
        case UICollectionElementKindSectionFooter:
            let footer = PostListFooter.dequeue(from: collectionView, at: indexPath)
            return footer!
        default:
            return UICollectionReusableView()
        }
    }
}

extension NewsFeedViewController {
    
    func cell(from collectionView: UICollectionView, at indexPath: IndexPath, for item: NewsFeedAd?) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func cell(from collectionView: UICollectionView, at indexPath: IndexPath, for item: NewsFeedPost?) -> UICollectionViewCell {
        guard let cell = PostListCell.dequeue(from: collectionView, at: indexPath), let post = item as? PostListCellItem else {
            return UICollectionViewCell()
        }
        cell.configure(for: post)
        cell.delegate = self
        return cell
    }
    
    func header(from collectionView: UICollectionView, at indexPath: IndexPath, for item: NewsFeedPost?) -> UICollectionReusableView {
        guard let header = PostListHeader.dequeue(from: collectionView, at: indexPath), let post = item else {
            return UICollectionReusableView()
        }
        
        header.configure(for: post)
        return header
    }
}
