//
//  ScrollViewController.swift
//  Pods
//
//  Created by Aaron Sapp on 3/4/16.
//
//

import Foundation

import UIKit

/// ScrollViewController is used for ViewControllers with a dynmaic height that needs to be scrollable if it extends beyond the view.
/// In order to use, the parent view must contain a UIScrollView with constraints of 0 to all four edges (containerScrollView).
/// UIScrollview must contain a UIView with contraints of 0 to all four edges and align center to Y/X (contentView).
public class ScrollViewController: UIViewController {
    @IBOutlet public var containerScrollView:UIScrollView!
    @IBOutlet public var contentView:UIView!
    
    @IBOutlet public var heightConstraint:NSLayoutConstraint!
    
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var maxY:CGFloat = 0
        var maxSubview = UIView.init(frame: CGRectMake(0,0,0,0))
        for subview in contentView.subviews {
            if subview.frame.origin.y > maxY {
                maxY = subview.frame.origin.y
                maxSubview = subview
            }
        }
        
        let height = maxY + maxSubview.frame.size.height + 30
        containerScrollView.contentSize = CGSizeMake(self.view.frame.size.width, height)
        heightConstraint.constant = height
    }
}