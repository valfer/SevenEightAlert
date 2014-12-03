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

        super.viewDidAppear(animated)

        SevenEightAlert().show("Alert", message : "I'm an iOS7 and iOS8 alert", viewController : self, okAction: {
            
            ()->() in
            
            println("alert dismissed")
            
        })

        
    }

}

