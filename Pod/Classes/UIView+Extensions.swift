//
//  UIView+Extensions.swift
//  Pods
//
//  Created by Aaron Sapp on 3/4/16.
//
//

import UIKit

extension UIView {
    
    // Additional UIView properties (accessible via storyboards)
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable public var borderColor: UIColor {
        get {
            return UIColor(CGColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.CGColor
        }
    }
    
    // Frame getters
    public func x() -> CGFloat {
        return self.frame.origin.x
    }
    public func y() -> CGFloat {
        return self.frame.origin.y
    }
    public func width() -> CGFloat {
        return self.frame.size.width
    }
    public func height() -> CGFloat {
        return self.frame.size.height
    }
    
    // Frame setters
    public func setX(x: CGFloat) {
        self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
    }
    public func setY(y: CGFloat) {
        self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height)
    }
    public func setWidth(width: CGFloat) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height)
    }
    public func setHeight(height: CGFloat) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height)
    }
}