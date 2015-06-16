//
//  UIValidationTextField.swift
//  SwiftTextFieldsSample
//
//  Created by Chelsea Farley on 9/06/15.
//  Copyright (c) 2015 Trip Wire. All rights reserved.
//

import UIKit

public class UIValidationTextField: UITextField {
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
}