//
//  UIGestureRecognizer+Extensions.swift
//  Pods
//
//  Created by Aaron Sapp on 4/23/16.
//
//

import Foundation

extension UIGestureRecognizer {
    /// Cancel the current gesture
    public func cancel() {
        enabled = false
        enabled = true
    }
}