//
//  KeyboardToolbar+Buttons.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 26.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit

extension KeyboardToolbar {
    
    func barButtonItemForTitle(title:String?, andType type:KeyboardToolBarButtonItemType) -> UIBarButtonItem {
        return UIBarButtonItem.barButtonItemForTitle(title, target: self, action: barButtonItemSelector, andTag: type.rawValue)
    }
    
    func defaultPreviousBarButtonItemForTitle(title:String) -> UIBarButtonItem {
        return barButtonItemForTitle(title, andType: .Previous)
    }
    
    func defaultNextBarButtonItemForTitle(title:String) -> UIBarButtonItem {
        return barButtonItemForTitle(title, andType: .Next)
    }
    
    func defaultPreviousBarButtonItem() -> UIBarButtonItem {
        return defaultPreviousBarButtonItemForTitle("<")
    }
    
    func defaultNextBarButtonItem() -> UIBarButtonItem {
        return defaultNextBarButtonItemForTitle(">")
    }
    
    func defaultDoneBarButtonItem() -> UIBarButtonItem {
        return barButtonItemForTitle("Done", andType: .Done)
    }
    
    func flexibleSpaceBarButtonItem() -> UIBarButtonItem {
        return UIBarButtonItem.flexibleSpaceBarButtonItem()
    }
}
