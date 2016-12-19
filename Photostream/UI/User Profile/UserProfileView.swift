//
//  UserProfileView.swift
//  Photostream
//
//  Created by Mounir Ybanez on 10/12/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit

class UserProfileView: UIView {

    var avatarImageView: UIImageView!
    var postLabel: UILabel!
    var postCountLabel: UILabel!
    var followerLabel: UILabel!
    var followerCountLabel: UILabel!
    var followingLabel: UILabel!
    var followingCountLabel: UILabel!
    var displayNameLabel: UILabel!
    var bioLabel: UILabel!
    var actionButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSetup()
    }
    
    func initSetup() {
        backgroundColor = UIColor.white
        
        avatarImageView = UIImageView()
        avatarImageView.backgroundColor = UIColor.lightGray
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.cornerRadius = avatarDimension / 2
        
        postLabel = UILabel()
        postLabel.text = "posts"
        postLabel.textColor = secondaryColor
        postLabel.textAlignment = .center
        postLabel.font = UIFont.systemFont(ofSize: 10, weight: UIFontWeightSemibold)
        
        postCountLabel = UILabel()
        postCountLabel.text = "0"
        postCountLabel.textColor = primaryColor
        postCountLabel.textAlignment = .center
        postCountLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFontWeightMedium)
        
        followerLabel = UILabel()
        followerLabel.text = "followers"
        followerLabel.textColor = postLabel.textColor
        followerLabel.textAlignment = .center
        followerLabel.font = postLabel.font
        
        followerCountLabel = UILabel()
        followerCountLabel.text = "0"
        followerCountLabel.textColor = postCountLabel.textColor
        followerCountLabel.textAlignment = .center
        followerCountLabel.font = postCountLabel.font
        
        followingLabel = UILabel()
        followingLabel.text = "following"
        followingLabel.textColor = postLabel.textColor
        followingLabel.textAlignment = .center
        followingLabel.font = postLabel.font
        
        followingCountLabel = UILabel()
        followingCountLabel.text = "0"
        followingCountLabel.textColor = postCountLabel.textColor
        followingCountLabel.textAlignment = .center
        followingCountLabel.font = postCountLabel.font
        
        actionButton = UIButton(type: .system)
        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 11, weight: UIFontWeightMedium)
        actionButton.setTitle("", for: .normal)
        actionButton.setTitleColor(primaryColor, for: .normal)
        actionButton.addTarget(self, action: #selector(self.didTapAction), for: .touchUpInside)
        actionButton.cornerRadius = 2
        actionButton.borderWidth = 1
        actionButton.borderColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        
        displayNameLabel = UILabel()
        displayNameLabel.text = "Me"
        displayNameLabel.textColor = primaryColor
        displayNameLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightMedium)
        
        bioLabel = UILabel()
        bioLabel.text = "Write your bio here..."
        bioLabel.textColor = primaryColor
        bioLabel.numberOfLines = 3
        bioLabel.font = UIFont.systemFont(ofSize: 12)
        
        addSubview(avatarImageView)
        addSubview(postLabel)
        addSubview(postCountLabel)
        addSubview(followerLabel)
        addSubview(followerCountLabel)
        addSubview(followingLabel)
        addSubview(followingCountLabel)
        addSubview(actionButton)
        addSubview(displayNameLabel)
        addSubview(bioLabel)
    }
    
    override func layoutSubviews() {
        var rect = CGRect.zero
        
        rect.origin.x = spacing * 2
        rect.origin.y = spacing * 2
        rect.size.width = avatarDimension
        rect.size.height = avatarDimension
        avatarImageView.frame = rect
        
        rect.origin.x += (spacing * 2)
        rect.origin.x += rect.size.width
        rect.size.width = ((frame.size.width - rect.origin.x) / 3) - (spacing * 2)
        rect.size.height = postCountLabel.sizeThatFits(rect.size).height
        postCountLabel.frame = rect
        
        rect.origin.x += rect.size.width
        rect.size.height = followerCountLabel.sizeThatFits(rect.size).height
        followerCountLabel.frame = rect
        
        rect.origin.x += rect.size.width
        rect.size.height = followingCountLabel.sizeThatFits(rect.size).height
        followingCountLabel.frame = rect
        
        rect.origin.x = postCountLabel.frame.origin.x
        rect.origin.y += max(postCountLabel.frame.size.height, followerCountLabel.frame.size.height, followingCountLabel.frame.size.height)
        rect.size.height = postLabel.sizeThatFits(rect.size).height
        postLabel.frame = rect
        
        rect.origin.x = followerCountLabel.frame.origin.x
        rect.size.height = followerLabel.sizeThatFits(rect.size).height
        followerLabel.frame = rect
        
        rect.origin.x = followingCountLabel.frame.origin.x
        rect.size.height = followingLabel.sizeThatFits(rect.size).height
        followingLabel.frame = rect
        
        rect.origin.x = postLabel.frame.origin.x
        rect.origin.y = max(postLabel.frame.maxY, followerLabel.frame.maxY, followingLabel.frame.maxY)
        rect.origin.y += (spacing * 2)
        rect.size.width = frame.width - rect.origin.x - (spacing * 2)
        rect.size.height = 28
        actionButton.frame = rect
        
        rect.origin.x = avatarImageView.frame.origin.x
        rect.origin.y = max(avatarImageView.frame.maxY, actionButton.frame.maxY)
        rect.origin.y += (spacing * 2)
        rect.size.width = frame.size.width - (spacing * 4)
        rect.size.height = displayNameLabel.sizeThatFits(rect.size).height
        displayNameLabel.frame = rect
        
        rect.origin.y += spacing
        rect.origin.y += rect.size.height
        rect.size.height = bioLabel.sizeThatFits(rect.size).height
        bioLabel.frame = rect
    }
}

extension UserProfileView {
    
    func didTapAction() {
        
    }
}

extension UserProfileView {
    
    var spacing: CGFloat {
        return 4
    }
    
    var avatarDimension: CGFloat {
        return 72
    }
    
    var primaryColor: UIColor {
        return UIColor(red: 10/255, green: 10/255, blue: 10/255, alpha: 1)
    }
    
    var secondaryColor: UIColor {
        return UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
    }
}
