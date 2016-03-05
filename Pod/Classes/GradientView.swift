//
//  GradientView.swift
//  Pods
//
//  Created by Aaron Sapp on 3/5/16.
//
//

import Foundation

@IBDesignable
class GradientView: UIView {
    @IBInspectable var startColor: UIColor = UIColor.init(white: 0, alpha: 0.8)
    @IBInspectable var endColor: UIColor = UIColor.clearColor()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    func setup() {
        let gradient = CAGradientLayer.init()
        gradient.frame = self.frame
        gradient.colors = [startColor.CGColor, endColor.CGColor]
        
        self.layer.addSublayer(gradient)
    }
}