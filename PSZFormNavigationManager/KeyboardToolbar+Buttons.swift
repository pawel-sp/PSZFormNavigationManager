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
    
    public func barButtonItemForTitle(title:String?, andType type:KeyboardToolBarButtonItemType) -> UIBarButtonItem {
        return UIBarButtonItem.barButtonItemForTitle(title, target: self, action: barButtonItemSelector, andTag: type.rawValue)
    }
    
    public func defaultPreviousBarButtonItemForTitle(title:String) -> UIBarButtonItem {
        return barButtonItemForTitle(title, andType: .Previous)
    }
    
    public func defaultNextBarButtonItemForTitle(title:String) -> UIBarButtonItem {
        return barButtonItemForTitle(title, andType: .Next)
    }
    
    public func defaultDoneBarButtonItemForTitle(title:String) -> UIBarButtonItem {
        return barButtonItemForTitle(title, andType: .Done)
    }
    
    public func defaultPreviousBarButtonItem() -> UIBarButtonItem {
        return defaultPreviousBarButtonItemForTitle(Settings.previousTitleShort)
    }
    
    public func defaultNextBarButtonItem() -> UIBarButtonItem {
        return defaultNextBarButtonItemForTitle(Settings.nextTitleShort)
    }
    
    public func defaultDoneBarButtonItem() -> UIBarButtonItem {
        return defaultDoneBarButtonItemForTitle(Settings.doneTitle)
    }
    
    public func flexibleSpaceBarButtonItem() -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem.flexibleSpaceBarButtonItem()
        barButtonItem.tag = KeyboardToolBarButtonItemType.FlexibleSpace.rawValue
        return barButtonItem
    }
}
