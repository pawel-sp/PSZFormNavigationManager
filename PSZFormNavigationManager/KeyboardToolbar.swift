//
//  KeyboardToolbar.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 26.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit

public enum KeyboardToolbarType {
    case Default
}

public enum KeyboardToolBarButtonItemType:Int {
    case Previous,Next,Done
}

public class KeyboardToolbar: UIToolbar {
   
    // MARK: - Properties
    
    class var barButtonItemSelector:Selector {
        return "didSelectBarButtonItem:"
    }
    var barButtonItemsDelegate:KeyboardToolbarDelegate?
    
    // MARK: - Utilities
    
    class func defaultToolBar() -> KeyboardToolbar {
        return KeyboardToolbar(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 50))
    }
    
    public class func keyboardToolbarForType(type:KeyboardToolbarType) -> KeyboardToolbar {
        let toolbar   = defaultToolBar()
        toolbar.items = itemsForType(type)
        return toolbar
    }
    
    class func itemsForType(type:KeyboardToolbarType) -> [AnyObject]? {
        switch type {
        case .Default:
            return [
                defaultPreviousBarButtonItem(),
                defaultNextBarButtonItem(),
                UIBarButtonItem.flexibleSpaceBarButtonItem(),
                defaultDoneBarButtonItem()
            ]
        default:
            return []
        }
    }
    
    // MARK: - Actions
    
    func didSelectBarButtonItem(sender:UIBarButtonItem) {
        barButtonItemsDelegate?.keyboardToolbar(self, didSelectBarButtonItem: sender)
    }
}
