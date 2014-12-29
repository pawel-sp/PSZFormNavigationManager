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
    
    /**
    Return bar button item with specified parameters.
    
    :param: title Title to display inside bar button item
    :param: type  Type is a number saved inside tag property. According to tag correct function invokes.
    */
    public func barButtonItemForTitle(title:String?, andType type:KeyboardToolBarButtonItemType) -> UIBarButtonItem {
        return UIBarButtonItem.barButtonItemForTitle(title, target: self, action: barButtonItemSelector, andTag: type.rawValue)
    }
    
    /**
    Returns default previous bar button item with specified parameters.
    
    :param: title Title to display inside previous bar button item.
    */
    public func defaultPreviousBarButtonItemForTitle(title:String) -> UIBarButtonItem {
        return barButtonItemForTitle(title, andType: .Previous)
    }
    
    /**
    Returns default next bar button item with specified parameters.
    
    :param: title Title to display inside next bar button item.
    */
    public func defaultNextBarButtonItemForTitle(title:String) -> UIBarButtonItem {
        return barButtonItemForTitle(title, andType: .Next)
    }
    
    /**
    Returns default done bar button item with specified parameters.
    
    :param: title Title to display inside done bar button item.
    */
    public func defaultDoneBarButtonItemForTitle(title:String) -> UIBarButtonItem {
        return barButtonItemForTitle(title, andType: .Done)
    }
    
    /// Returns default previous bar button item with title "<"
    public func defaultPreviousBarButtonItem() -> UIBarButtonItem {
        return defaultPreviousBarButtonItemForTitle(Settings.previousTitleShort)
    }
    
    /// Returns default next bar button item with title ">"
    public func defaultNextBarButtonItem() -> UIBarButtonItem {
        return defaultNextBarButtonItemForTitle(Settings.nextTitleShort)
    }
    
    /// Returns default done bar button item with title "Done"
    public func defaultDoneBarButtonItem() -> UIBarButtonItem {
        return defaultDoneBarButtonItemForTitle(Settings.doneTitle)
    }
    
    /// Returns flexible space bar button item.
    public func flexibleSpaceBarButtonItem() -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem.flexibleSpaceBarButtonItem()
        barButtonItem.tag = KeyboardToolBarButtonItemType.FlexibleSpace.rawValue
        return barButtonItem
    }
}
