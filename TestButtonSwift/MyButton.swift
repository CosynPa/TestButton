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
        
        titleLabel?.font = UIFont.systemFont(ofSize: 11)
        setImage(#imageLiteral(resourceName: "chrome"), for: .normal)
        setTitle("Button", for: .normal)
        self.contentVerticalAlignment = .fill
        
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: -2)
        
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
        
//        for i in stride(from: CGFloat(5), through: 100, by: 0.1) {
//            titleLabel?.font = UIFont.systemFont(ofSize: i)
//            let size = intrinsicContentSize
//            
//            assert(floor(size.width) == size.width && floor(size.height) == size.height)
//        }
    }
    
    override func contentRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.contentRect(forBounds: bounds)
//        print("content rect \(rect) bounds \(bounds.size)")
        return rect
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let rect = super.titleRect(forContentRect: contentRect)
        print("title rect \(rect) content \(contentRect)")
        return rect
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let rect = super.imageRect(forContentRect: contentRect)
//        print("title rect \(rect) content \(contentRect)")
        return rect
    }
}
