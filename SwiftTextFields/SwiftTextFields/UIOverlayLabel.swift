//
//  UIOverlayLabel.swift
//
//  Created by Chelsea Farley on 31/12/14.
//  Copyright (c) 2014 Trip Wire. All rights reserved.
//

import UIKit

public class UIOverlayLabel: UILabel {
    private var xMargin : CGFloat = 0
    private var yMargin : CGFloat = 0
    
    override public func drawTextInRect(rect: CGRect) {
        let newRect = CGRectOffset(rect, xMargin, yMargin)
        super.drawTextInRect(newRect)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(bounds: CGRect, textColor: UIColor, textAlignment : NSTextAlignment,
        message: String, font: UIFont, textXMargin: CGFloat) {
        self.init(frame: bounds)
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.text = message
        self.font = font
        self.xMargin = textXMargin
    }
    
    convenience init(bounds: CGRect, textColor: UIColor, textAlignment : NSTextAlignment,
        message: String, font: UIFont) {
            self.init(frame: bounds)
            self.textColor = textColor
            self.textAlignment = textAlignment
            self.text = message
            self.font = font
            self.xMargin = -10
    }
    
    // will give you an error if you try to compile without this
    // after adding the above constructors
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
