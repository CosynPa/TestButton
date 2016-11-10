//
//  MyButton.swift
//  TestButtonSwift
//
//  Created by CosynPa on 11/9/16.
//  Copyright © 2016 CosynPa. All rights reserved.
//

import UIKit

class MyButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        _ = titleLabel
        _ = imageView
        
        setImage(#imageLiteral(resourceName: "chrome"), for: .normal)
        setTitle("aaa", for: .normal)
        
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 0.2, bottom: 0, right: 0)
        
        let font = titleLabel!.font!
        
        let titleSize: CGSize
        if let currentTitle = currentTitle {
            titleSize = (currentTitle as NSString).size(attributes: [NSFontAttributeName: font])
        } else {
            titleSize = .zero
        }
        
        let imageSize = currentImage?.size ?? .zero
        
        print("title size \(titleSize)")
        print("image size \(imageSize)")
        
        let height = max(titleSize.height, imageSize.height)
        let width = titleSize.width + imageSize.width
        
        print("content size \(width) \(height)")
        
        print("intinsic size \(intrinsicContentSize)")
    }
    
    override func contentRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.contentRect(forBounds: bounds)
        print("content rect \(rect) bounds \(bounds.size)")
        return rect
    }
}
