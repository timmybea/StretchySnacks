//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Tim Beals on 2016-12-08.
//  Copyright © 2016 Tim Beals. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MyNavHeight: NSLayoutConstraint!
    @IBOutlet weak var MyNavView: UIView!
    var isNavUp = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func plusIconPressed(_ sender: UIButton)
    {
        
        UIView.animate(withDuration: 5.0, animations: {
            if(self.isNavUp)
            {
                self.MyNavHeight.constant = 200.0;
                self.isNavUp = false
            }
            else
            {
                self.MyNavHeight.constant = 64.0
                self.isNavUp = true
            }
           // UIView.layoutIfNeeded(self.MyNavView)
        })
    }


}

