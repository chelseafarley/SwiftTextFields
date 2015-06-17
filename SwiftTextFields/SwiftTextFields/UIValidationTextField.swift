//
//  UIValidationTextField.swift
//  SwiftTextFieldsSample
//
//  Created by Chelsea Farley on 9/06/15.
//  Copyright (c) 2015 Trip Wire. All rights reserved.
//

import UIKit

@IBDesignable public class UIValidationTextField: UITextField {
    var overlayView : UIView!
    var isValid = true
    
    public func validateInput() -> Bool {
        return isValid
    }
    
    public func showOrHideOverlay() {
        if (isValid && rightView != nil) {
            rightView = nil
            rightViewMode = UITextFieldViewMode.Never
        } else if (!isValid && rightView == nil) {
            rightView = overlayView
            rightViewMode = UITextFieldViewMode.Always
        }
    }
    
    @IBInspectable public var messageColor : UIColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1) {
        didSet {
            (overlayView as! UIOverlayLabel).textColor = messageColor
        }
    }
    
    @IBInspectable public var messageFont : UIFont = UIFont.systemFontOfSize(10) {
        didSet {
            (overlayView as! UIOverlayLabel).font = messageFont
        }
    }
}