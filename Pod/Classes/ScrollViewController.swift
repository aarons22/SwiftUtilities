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
    @IBOutlet var containerScrollView:UIScrollView!
    @IBOutlet var contentView:UIView!
    
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var maxY:CGFloat = 0
        var maxSubview: UIView!
        for subview in contentView.subviews {
            if subview.frame.origin.y > maxY {
                maxY = subview.frame.origin.y
                maxSubview = subview
            }
        }
        containerScrollView.contentSize = CGSizeMake(self.view.frame.size.width,maxY + maxSubview.frame.size.height + 30)
    }
}