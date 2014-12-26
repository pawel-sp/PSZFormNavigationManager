//
//  KeyboardToolbar+Buttons.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 26.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit

extension KeyboardToolbar {
    
    class func barButtonItemForTitle(title:String?, andType type:KeyboardToolBarButtonItemType) -> UIBarButtonItem {
        return UIBarButtonItem.barButtonItemForTitle(title, target: self, action: barButtonItemSelector, andTag: type.rawValue)
    }
    
    public class func defaultPreviousBarButtonItem() -> UIBarButtonItem {
        return barButtonItemForTitle("<", andType: .Previous)
    }
    
    public class func defaultNextBarButtonItem() -> UIBarButtonItem {
        return barButtonItemForTitle(">", andType: .Next)
    }
    
    public class func defaultDoneBarButtonItem() -> UIBarButtonItem {
        return barButtonItemForTitle("Done", andType: .Done)
    }
}
