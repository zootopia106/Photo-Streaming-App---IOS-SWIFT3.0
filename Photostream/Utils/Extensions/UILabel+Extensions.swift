//
//  UILabel+Extensions.swift
//  Photostream
//
//  Created by Mounir Ybanez on 17/08/2016.
//  Copyright © 2016 Mounir Ybanez. All rights reserved.
//

import UIKit

extension UILabel {

    class func createPlaceholderImageWithFrame(frame: CGRect, text: String, font: UIFont) -> UIImage {
        let label = UILabel(frame: frame)
        label.font = font
        label.textAlignment = .Center
        label.text = text
        label.backgroundColor = UIColor.randomColor()
        label.textColor = UIColor.whiteColor()

        return label.createImage()
    }
    
    class func createNavigationTitleView(text: String) -> UILabel {
        let titleView = UILabel(frame: CGRect.zero)
        let fontDesc = UIFontDescriptor(name: "Snell Roundhand", size: 24).fontDescriptorWithSymbolicTraits(.TraitBold)
        titleView.font = UIFont(descriptor: fontDesc, size: fontDesc.pointSize)
        titleView.text = text
        titleView.sizeToFit()
        return titleView
    }
    
    override public var bounds: CGRect {
        didSet {
            self.preferredMaxLayoutWidth = self.bounds.width
        }
    }
}
