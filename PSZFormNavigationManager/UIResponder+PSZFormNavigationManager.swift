//
//  UIResponder+PSZFormNavigationManager.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 28.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit

extension UIResponder {
    
    struct Static {
        static var firstCurrentResponder:UIResponder?
    }
    
    class func currentFirstResponder() -> UIResponder {
        Static.firstCurrentResponder = nil
        UIApplication.sharedApplication().sendAction("findFirstResponder:", to: nil, from: nil, forEvent: nil)
        return Static.firstCurrentResponder!
    }
    
    func findFirstResponder(sender:AnyObject) {
        Static.firstCurrentResponder = self
    }
}
