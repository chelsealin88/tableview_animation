//
//  PresentViewViewController.swift
//  animation test
//
//  Created by Chelsea Lin on 2019/9/12.
//  Copyright © 2019 chelsea lin. All rights reserved.
//

import UIKit

class PresentViewViewController: UIViewController {

    @IBOutlet weak var mybutton: UIButton!
    @IBOutlet weak var presentView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func mybutton(_ sender: Any) {
        presentView.isHidden = false
        
    }

}
