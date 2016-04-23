//
//  UIScrollView+Extensions.swift
//  Pods
//
//  Created by Aaron Sapp on 4/9/16.
//
//

import UIKit

extension UIScrollView {
    
    public override func addKeyBoardToView(tapDismiss: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(UIScrollView.keyboardWasShown(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(UIScrollView.keyboardWillBeHidden(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        if tapDismiss {
            let singleTap = UITapGestureRecognizer.init(target: self, action: #selector(UIView.endEditing(_:)))
            self.addGestureRecognizer(singleTap)
        }
    }
    
    public override func removeKeyboardFromFromView() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func keyboardWasShown(notification: NSNotification) {
        let info = notification.userInfo
        
//        let animationDuration = info![UIKeyboardAnimationDurationUserInfoKey]?.doubleValue
//        let curveDuration = info![UIKeyboardAnimationCurveUserInfoKey]?.doubleValue
        
        let keyboardSize = info![UIKeyboardFrameBeginUserInfoKey]?.CGRectValue().size
        
        let contentInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: (keyboardSize?.height)!, right: 0)
        self.contentInset = contentInsets
        self.scrollIndicatorInsets = contentInsets
    }
    
    override func keyboardWillBeHidden(notification: NSNotification) {
        let contentInsets = UIEdgeInsetsZero
        self.contentInset = contentInsets
        self.scrollIndicatorInsets = contentInsets
    }
}