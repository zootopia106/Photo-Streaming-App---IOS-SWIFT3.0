//
//  ActivityTableCellItem.swift
//  Photostream
//
//  Created by Mounir Ybanez on 23/12/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import Kingfisher
import DateTools

protocol ActivityTableCellItem {
    
    var displayName: String { set get }
    var avatarUrl: String { set get }
    var timestamp: Double { set get }
    var content: String { get }
}

protocol ActivityTableCellLikeItem: ActivityTableCellItem {
    
    var photoUrl: String { set get }
}

protocol ActivityTableCellPostItem: ActivityTableCellItem {
    
    var photoUrl: String { set get }
}

protocol ActivityTableCellCommentItem: ActivityTableCellItem {
    
    var photoUrl: String { set get }
    var message: String { set get }
}

protocol ActivityTableCellFollowItem: ActivityTableCellItem { }

protocol ActivityTableCellConfig {
    
    var dynamicHeight: CGFloat { get }
}

protocol ActivityTableLikeCellConfig: ActivityTableCellConfig {
    
    func configure(with item: ActivityTableCellLikeItem?, isPrototype: Bool)
    func setup(photo url: String)
    func setup(avatar url: String, placeholder image: UIImage?)
    func setup(content: String, displayName: String)
}

protocol ActivityTablePostCellConfig: ActivityTableCellConfig {
    
    func configure(with item: ActivityTableCellPostItem?, isPrototype: Bool)
}

protocol ActivityTableCommentCellConfig: ActivityTableCellConfig {
    
    func configure(with item: ActivityTableCellCommentItem?, isPrototype: Bool)
}

protocol ActivityTableFollowCellConfig: ActivityTableCellConfig {
 
    func configure(with item: ActivityTableCellFollowItem?, isPrototype: Bool)
}

extension ActivityTableLikeCellConfig {
    
    func authorPlaceholder(with name: String, size: CGSize) -> UIImage {
        let frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let font = UIFont.systemFont(ofSize: 10)
        let image = UILabel.createPlaceholderImageWithFrame(frame, text: name[0], font: font)
        return image
    }
}

extension ActivityTableLikeCell: ActivityTableLikeCellConfig {
    
    var dynamicHeight: CGFloat {
        var height = max(contentLabel.frame.maxY + spacing, 0)
        height = max(avatarDimension + spacing * 2, height)
        height = max(photoDimension + spacing * 2, height)
        return height
    }
    
    func configure(with item: ActivityTableCellLikeItem?, isPrototype: Bool = false) {
        guard let item = item else {
            return
        }
        
        setup(content: item.content, displayName: item.displayName)
        
        if !isPrototype {
            setup(photo: item.photoUrl)
            
            let image = authorPlaceholder(
                with: item.displayName,
                size: CGSize(width: avatarDimension, height: avatarDimension)
            )
            setup(avatar: item.avatarUrl, placeholder: image)
        }
        
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func setup(content: String, displayName: String) {
        let contentMessage = content.replaceFirstOccurrence(of: displayName, to: "").trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        let font = contentLabel.font!
        
        let semiBold = UIFont.systemFont(ofSize: font.pointSize, weight: UIFontWeightSemibold)
        let regular = UIFont.systemFont(ofSize: font.pointSize)
        
        let name = NSAttributedString(string: displayName, attributes: [NSFontAttributeName: semiBold])
        let message = NSAttributedString(string: contentMessage, attributes: [NSFontAttributeName: regular])
        
        let text = NSMutableAttributedString()
        text.append(name)
        text.append(NSAttributedString(string: " "))
        text.append(message)
        
        contentLabel.attributedText = text
    }
    
    func setup(photo url: String) {
        guard let downloadUrl = URL(string: url) else {
            return
        }
        
        let resource = ImageResource(downloadURL: downloadUrl)
        photoImageView.kf.setImage(with: resource)
    }
    
    func setup(avatar url: String, placeholder image: UIImage?) {
        guard let downloadUrl = URL(string: url) else {
            avatarImageView.image = image
            return
        }
        
        let resource = ImageResource(downloadURL: downloadUrl)
        avatarImageView.kf.setImage(
            with: resource,
            placeholder: image,
            options: nil,
            progressBlock: nil,
            completionHandler: nil)
    }
}
