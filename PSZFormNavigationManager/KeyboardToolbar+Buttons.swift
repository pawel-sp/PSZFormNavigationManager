//
//  KeyboardToolbar+Buttons.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 26.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit

extension KeyboardToolbar {
    
    public class func defaultPreviousBarButtonItem() -> UIBarButtonItem {
        return UIBarButtonItem.barButtonItemForTitle("<", target: self, action: barButtonItemSelector, andTag: KeyboardToolBarButtonItemType.Previous.rawValue)
    }
    
}
