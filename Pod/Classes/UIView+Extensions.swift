//
//  UIView+Extensions.swift
//  Pods
//
//  Created by Aaron Sapp on 3/4/16.
//
//

import UIKit

extension UIView {
    
    public func addKeyBoardToView(tapDismiss: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(UIScrollView.keyboardWasShown(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(UIScrollView.keyboardWillBeHidden(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        if tapDismiss {
            let singleTap = UITapGestureRecognizer.init(target: self, action: #selector(UIView.endEditing(_:)))
            self.addGestureRecognizer(singleTap)
        }
    }
    
    public func removeKeyboardFromFromView() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWasShown(notification: NSNotification) {
        let info = notification.userInfo
        
        let animationDuration = info![UIKeyboardAnimationDurationUserInfoKey]?.doubleValue
//        let animationCurve:UIViewAnimationCurve = info![UIKeyboardAnimationCurveUserInfoKey]?.intValue
        
        let keyboardSize = info![UIKeyboardFrameBeginUserInfoKey]?.CGRectValue().size
        let offset = self.window!.frame.size.height - self.height - self.y
        
        if animationDuration != nil && false {
//            UIView.animateWithDuration(animationDuration!, delay: 0.0, options: (animationCurve << 16), animations: {
//                
//                }, completion: nil)
        } else {
            self.y = self.y - keyboardSize!.height + offset
        }
    }
    
    func keyboardWillBeHidden(notification: NSNotification) {
        
    }
    /// Screenshot of current view
    public func screenshot() -> UIImage {
        if UIScreen.mainScreen().respondsToSelector(#selector(NSDecimalNumberBehaviors.scale)) {
            UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.mainScreen().scale)
        } else {
            UIGraphicsBeginImageContext(self.bounds.size)
        }
        let context = UIGraphicsGetCurrentContext()
        self.layer.renderInContext(context!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    /// Add radius to specific (or all) corners
    public func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
    }
    
    // Additional UIView properties (also accessible via storyboards)
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set(value) {
            layer.cornerRadius = value
            layer.masksToBounds = value > 0
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set(value) {
            layer.borderWidth = value
        }
    }
    
    @IBInspectable public var borderColor: UIColor {
        get {
            return UIColor(CGColor: layer.borderColor!)
        }
        set(value) {
            layer.borderColor = value.CGColor
        }
    }
    
    // Frame setters/getters
    public var x: CGFloat {
        get {
            return self.frame.origin.y
        }
        set(value) {
            self.frame = CGRect(x: value, y: self.y, width: self.width, height: self.height)
        }
    }
    
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        } 
        set(value) {
            self.frame = CGRect(x: self.x, y: value, width: self.width, height: self.height)
        }
    }
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set(value) {
            self.frame = CGRect(x: self.x, y: self.y, width: value, height: self.height)
        }
    }
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set(value) {
            self.frame = CGRect(x: self.x, y: self.y, width: self.width, height: value)
        }
    }
}