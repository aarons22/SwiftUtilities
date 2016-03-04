//
//  ViewController.swift
//  SwiftUtilities
//
//  Created by Aaron Sapp on 03/04/2016.
//  Copyright (c) 2016 Aaron Sapp. All rights reserved.
//

import UIKit
import SwiftUtilities

class ViewController: UIViewController {
    @IBOutlet var testView:UIView!
    
    @IBOutlet var setXTextView:UITextField!
    
    @IBAction func setXValue(sender: UIButton) {
        if let n = NSNumberFormatter().numberFromString(setXTextView.text!) {
            self.testView.setX(CGFloat(n))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

