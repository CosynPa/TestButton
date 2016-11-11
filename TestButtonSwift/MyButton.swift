//
//  MyButton.swift
//  TestButtonSwift
//
//  Created by CosynPa on 11/9/16.
//  Copyright © 2016 CosynPa. All rights reserved.
//

import UIKit

class MyButton: UIButton {
    var titleInited = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        _ = titleLabel
        _ = imageView
        
        titleLabel?.font = UIFont.systemFont(ofSize: 11)
        setTitleShadowColor(.blue, for: .normal)
        titleLabel?.shadowOffset = CGSize(width: 0, height: 20)
        titleLabel?.clipsToBounds = false
        setImage(#imageLiteral(resourceName: "xcode"), for: .normal)
        setTitle("Button", for: .normal)
        self.contentVerticalAlignment = .center
        
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 0.1, bottom: 0, right: 0)
        
        let font = titleLabel!.font!
        
        let titleSize: CGSize
        if let currentTitle = currentTitle {
            titleSize = (currentTitle as NSString).size(attributes: [NSFontAttributeName: font])
        } else {
            titleSize = .zero
        }
        
        let titleSize2 = titleLabel!.sizeThatFits(CGSize(width: 1000, height: 1000))
        
        let imageSize = currentImage?.size ?? .zero
        
        print("-----------")
        
        print("title size \(titleSize)")
        print("title size 2 \(titleSize2)")
        
        print("image size \(imageSize)")
        
        let height = max(titleSize2.height, imageSize.height)
        let width = titleSize2.width + imageSize.width
        
        print("content size \(width) \(height)")
        
        print("intrinsic size \(intrinsicContentSize)")
        
        print("-----------")
        
        
        
//        for i in stride(from: CGFloat(5), through: 100, by: 0.1) {
//            titleLabel?.font = UIFont.systemFont(ofSize: i)
//            let size = intrinsicContentSize
//            
//            let delX = size.width - imageSize.width
//            let delY = size.height - imageSize.height
//            
//            func isInteger(_ x: CGFloat) -> Bool {
//                let rounded = (x * 1000).rounded() / 1000
//                return abs(x - rounded) < 0.001
//            }
//            
//            assert(isInteger(delX) && isInteger(delY))
//        }
    }
    
    override func contentRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.contentRect(forBounds: bounds)
//        print("content rect \(rect) bounds \(bounds.size)")
        return rect
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let rect = super.titleRect(forContentRect: contentRect)
//        print("title rect \(rect) content \(contentRect)")
        return rect
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let rect = super.imageRect(forContentRect: contentRect)
//        print("title rect \(rect) content \(contentRect)")
        return rect
    }
    
    override var intrinsicContentSize: CGSize {
        print("call intrinsicContentSize")
        let size = super.intrinsicContentSize
        return size
    }
    
    override var titleLabel: UILabel? {
        titleInited = true
        print("title init")
        let label = super.titleLabel
        return label
    }
}
