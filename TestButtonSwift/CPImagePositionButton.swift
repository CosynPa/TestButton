//
//  CPImagePositionButton.swift
//  TestButtonSwift
//
//  Created by CosynPa on 11/11/16.
//  Copyright © 2016 CosynPa. All rights reserved.
//

import UIKit

public enum CPTitlePosition: Int {
    case left, right, top, bottom
}

open class CPImagePositionButton: UIButton {
    open var imagePosition = CPTitlePosition.left {
        didSet {
            setNeedsLayout()
        }
    }
    
    override open var intrinsicContentSize: CGSize {
        guard buttonType == .custom else { return super.intrinsicContentSize }
        
        
        
        return .zero
    }
    
    private func titleSize(inSize: CGSize) -> CGSize {
        let titleSize: CGSize
        if let currentAttributedTitle = currentAttributedTitle {
            titleSize = currentAttributedTitle.boundingRect(with: inSize, options: [], context: nil).size
        } else if let currentTitle = currentTitle {
            let label = titleLabel!
            
            let font = label.font!
            
            let shadow = label.shadowOffset != CGSize.zero ? NSShadow() : nil
            shadow?.shadowColor = currentTitleShadowColor
            shadow?.shadowOffset = label.shadowOffset
            
            var attributes: [String: Any] = [NSFontAttributeName: font]
            attributes[NSShadowAttributeName] = shadow
            
            titleSize = (currentTitle as NSString).boundingRect(with: inSize, options: [], attributes: attributes, context: nil).size
        } else {
            titleSize = .zero
        }
        return titleSize
    }
}
