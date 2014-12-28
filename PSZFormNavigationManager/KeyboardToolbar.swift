//
//  KeyboardToolbar.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 26.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit

public enum KeyboardToolbarType {
    case Default, Text, DefaultCentered, TextCentered
}

public enum KeyboardToolBarButtonItemType:Int {
    case Previous,Next,Done
}

public class KeyboardToolbar: UIToolbar {
   
    // MARK: - Settings 
    
    struct Settings {
        static let previousTitle = "Prev"
        static let nextTitle     = "Next"
    }
    
    // MARK: - Properties
    
    var barButtonItemSelector:Selector {
        return "didSelectBarButtonItem:"
    }
    var barButtonItemsDelegate:KeyboardToolbarDelegate?
    
    // MARK: - Utilities
    
    class func defaultToolBar() -> KeyboardToolbar {
        return KeyboardToolbar(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 50))
    }
    
    public class func keyboardToolbarForType(type:KeyboardToolbarType) -> KeyboardToolbar {
        let toolbar = defaultToolBar()
        toolbar.setItemsForType(type)
        return toolbar
    }
    
    func setItemsForType(type:KeyboardToolbarType) {
        switch type {
        case .Default:
            items = [
                defaultPreviousBarButtonItem(),
                defaultNextBarButtonItem(),
                flexibleSpaceBarButtonItem(),
                defaultDoneBarButtonItem()
            ]
        case .Text :
            items = [
                defaultPreviousBarButtonItemForTitle(Settings.previousTitle),
                defaultNextBarButtonItemForTitle(Settings.nextTitle),
                flexibleSpaceBarButtonItem(),
                defaultDoneBarButtonItem()
            ]
        case .DefaultCentered:
            items = [
                defaultPreviousBarButtonItem(),
                flexibleSpaceBarButtonItem(),
                defaultDoneBarButtonItem(),
                flexibleSpaceBarButtonItem(),
                defaultNextBarButtonItem()
            ]
        case .TextCentered:
            items = [
                defaultPreviousBarButtonItemForTitle(Settings.previousTitle),
                flexibleSpaceBarButtonItem(),
                defaultDoneBarButtonItem(),
                flexibleSpaceBarButtonItem(),
                defaultNextBarButtonItemForTitle(Settings.nextTitle)
            ]
        default:
            items = []
        }
    }
    
    // MARK: - Actions
    
    func didSelectBarButtonItem(sender:UIBarButtonItem) {
        barButtonItemsDelegate?.keyboardToolbar(self, didSelectBarButtonItem: sender)
    }
}
