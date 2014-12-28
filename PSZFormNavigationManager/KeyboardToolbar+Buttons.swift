//
//  KeyboardToolbar+Buttons.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 26.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit

public enum KeyboardToolBarButtonItemType:Int {
    case Previous,Next,Done,FlexibleSpace
}

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
        return defaultPreviousBarButtonItemForTitle(Settings.previousTitleShort)
    }
    
    func defaultNextBarButtonItem() -> UIBarButtonItem {
        return defaultNextBarButtonItemForTitle(Settings.nextTitleShort)
    }
    
    func defaultDoneBarButtonItem() -> UIBarButtonItem {
        return barButtonItemForTitle(Settings.doneTitle, andType: .Done)
    }
    
    func flexibleSpaceBarButtonItem() -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem.flexibleSpaceBarButtonItem()
        barButtonItem.tag = KeyboardToolBarButtonItemType.FlexibleSpace.rawValue
        return barButtonItem
    }
}
