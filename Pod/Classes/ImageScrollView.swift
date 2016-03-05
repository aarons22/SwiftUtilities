//
//  ImageScrollView.swift
//  Pods
//
//  Created by Aaron Sapp on 3/4/16.
//
//

import UIKit

public class ImagePageControlView: UIScrollView, UIScrollViewDelegate {
    
    var images = [UIImage]()
    var pageControl:UIPageControl!
    var imageContentMode: UIViewContentMode = .ScaleAspectFit
    
    /// Setup the image scrollview. Note: Always call this in viewDidLayoutSubviews() if using Autolayout
    public func setup() {
        self.pagingEnabled = true
        self.delegate = self
        
        configureScrollView()
        configurePageControl()
    }
    
    func configureScrollView() {
        var runningX: CGFloat = 0
        
        // Because we're calling this in viewDidLayoutSubviews(), it's getting called multiple times
        // so we need to clear out the previous subviews in favor of the more accurate ones
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
        if (pageControl != nil) {
            pageControl.removeFromSuperview()
        }
        
        // Add images into the scrollview content area
        for image in images {
            let imageView = UIImageView.init(image: image)
            imageView.contentMode = imageContentMode
            imageView.frame = CGRectMake(runningX, 0, self.width, self.height)
            runningX += self.width
            
            self.addSubview(imageView)
        }
        
        self.contentSize = CGSizeMake(runningX, self.height)
    }
    
    func configurePageControl() {
        pageControl = UIPageControl.init(frame: CGRectMake(0, self.height - 50, self.width, 50))
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: Selector("changePage:"), forControlEvents: .ValueChanged)
        
        self.superview?.addSubview(pageControl)
        if images.count == 1 {
            pageControl.hidden = true
        }
    }
    
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * self.frame.size.width
        self.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    // MARK: UIScrollViewDelegate
    
    public func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}