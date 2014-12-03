//
//  ExtAlert.swift
//  iDoctors
//
//  Created by Valerio Ferrucci on 30/09/14.
//  Copyright (c) 2014 Tabasoft. All rights reserved.
//

import UIKit

public class VFAlert : NSObject, UIAlertViewDelegate {

    var okAction : (()->())?
    
    // Declare a global var to produce a unique address as the assoc object handle
    private var assocObjectHandle: UInt8 = 0
    private var assocViewController: UIViewController?

    public func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        if let _okaction = self.okAction {
            
            _okaction()
            
            if assocViewController != nil {
                objc_setAssociatedObject(assocViewController, &assocObjectHandle, nil, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC));
                assocViewController = nil
            }
        }
    }
    
    public func show(title : String, message : String, viewController : UIViewController, okAction : (()->())? = nil) {
        
        let version:NSString = UIDevice.currentDevice().systemVersion as NSString;

        if  version.doubleValue >= 8 {
            let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle:.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) in
                
                if let _okAction = okAction {
                    
                    _okAction()
                }
            }))
            viewController.presentViewController(alert, animated:true, completion:nil);
            
        } else {
            let alert:UIAlertView = UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "OK")
            self.okAction = okAction
            alert.delegate = self

            // extend my life please
            if okAction != nil {
                assocViewController = viewController
                objc_setAssociatedObject(viewController, &assocObjectHandle, self, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
            }
            
            alert.show()
        }
    }
}