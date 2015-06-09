//
//  CompulsoryTextField.swift
//  SwiftTextFieldsSample
//
//  Created by Chelsea Farley on 8/06/15.
//  Copyright (c) 2015 Trip Wire. All rights reserved.
//

import UIKit

public class CompulsoryTextField: UIValidationTextField, UITextFieldDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.keyboardType = UIKeyboardType.NumberPad
    }
    
    convenience init(bounds: CGRect, overlayLabelBounds: CGRect, textColor: UIColor, textAlignment : NSTextAlignment,
        message: String, font: UIFont, textXMargin: CGFloat) {
            self.init(frame: bounds)
            self.overlayView = UIOverlayLabel(bounds: overlayLabelBounds, textColor: textColor,
                textAlignment: textAlignment,  message: message, font: font, textXMargin: textXMargin)
    }
    
    convenience init(bounds: CGRect, overlayLabelBounds: CGRect,  textColor: UIColor, textAlignment : NSTextAlignment,
        message: String, font: UIFont) {
            self.init(frame: bounds)
            self.overlayView = UIOverlayLabel(bounds: overlayLabelBounds, textColor: textColor,
                textAlignment: textAlignment, message: message, font: font)
    }
    
    convenience init(bounds: CGRect, overlayView: UIView) {
        self.init(frame: bounds)
        self.overlayView = overlayView
    }
    
    // Default if using story board
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        var bounds = CGRect(x: 0, y: 0, width: 150, height: 40)
        var textColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1)
        var font = UIFont.systemFontOfSize(10)
        
        self.overlayView = UIOverlayLabel(bounds: bounds, textColor: textColor,
            textAlignment: NSTextAlignment.Right, message: "Please enter a value", font: font)
    }
    
    public func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // Get the attempted new string by replacing the new characters in the
        // appropriate range
        let newString = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        if (count(newString) == 0) {
            isValid = false
        } else {
            isValid = true
        }
        
        showOrHideOverlay()
        return true
    }
}
