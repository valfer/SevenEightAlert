//
//  ViewController.swift
//  SevenEightAlert
//
//  Created by Valerio Ferrucci on 03/12/14.
//  Copyright (c) 2014 Valerio Ferrucci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated : Bool) {
        
        VFAlert().show("Alert", message : "I'm a ios7 and 8 alert", viewController : self, okAction: {
            
            ()->() in
            
            println("alert dismissed")
            
            })
        
    }

}

