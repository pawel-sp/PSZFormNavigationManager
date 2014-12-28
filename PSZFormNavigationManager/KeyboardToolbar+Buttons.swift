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
    
    func defaultPreviousBarButtonItem() -> UIBarButtonItem {
        return barButtonItemForTitle("<", andType: .Previous)
    }
    
    func defaultNextBarButtonItem() -> UIBarButtonItem {
        return barButtonItemForTitle(">", andType: .Next)
    }
    
    func defaultDoneBarButtonItem() -> UIBarButtonItem {
        return barButtonItemForTitle("Done", andType: .Done)
    }
    
    func flexibleSpaceBarButtonItem() -> UIBarButtonItem {
        return UIBarButtonItem.flexibleSpaceBarButtonItem()
    }
}
