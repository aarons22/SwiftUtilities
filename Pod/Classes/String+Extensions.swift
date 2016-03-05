//
//  String+Extensions.swift
//  Pods
//
//  Created by Aaron Sapp on 3/5/16.
//
//

import Foundation
extension String {
    
    public var lastPathComponent: String {
        
        get {
            return (self as NSString).lastPathComponent
        }
    }
    public var pathExtension: String {
        
        get {
            
            return (self as NSString).pathExtension
        }
    }
    public var stringByDeletingLastPathComponent: String {
        
        get {
            
            return (self as NSString).stringByDeletingLastPathComponent
        }
    }
    public var stringByDeletingPathExtension: String {
        
        get {
            
            return (self as NSString).stringByDeletingPathExtension
        }
    }
    public var pathComponents: [String] {
        
        get {
            
            return (self as NSString).pathComponents
        }
    }
    
    public func stringByAppendingPathComponent(path: String) -> String {
        
        let nsSt = self as NSString
        
        return nsSt.stringByAppendingPathComponent(path)
    }
    
    public func stringByAppendingPathExtension(ext: String) -> String? {
        
        let nsSt = self as NSString
        
        return nsSt.stringByAppendingPathExtension(ext)
    }
}