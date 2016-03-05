//
//  UIView+Extensions.swift
//  Pods
//
//  Created by Aaron Sapp on 3/4/16.
//
//

import UIKit

extension UIView {
    
    /// Screenshot of current view
    public func screenshot() -> UIImage {
        if UIScreen.mainScreen().respondsToSelector(Selector("scale")) {
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