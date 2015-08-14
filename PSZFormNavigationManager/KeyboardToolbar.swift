//
//  KeyboardToolbar.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 26.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit

public enum KeyboardToolbarType {
    case Default, Text, DefaultCentered, TextCentered, OnlyNext, OnlyNextText, OnlyPrev, OnlyPrevText
}

public class KeyboardToolbar: UIToolbar {
   
    // MARK: - Settings 
    
    struct Settings {
        static let previousTitle      = "Prev"
        static let nextTitle          = "Next"
        static let previousTitleShort = "<"
        static let nextTitleShort     = ">"
        static let doneTitle          = "Done"
    }
    
    // MARK: - Properties
    
    var barButtonItemSelector:Selector {
        return "didSelectBarButtonItem:"
    }
    var barButtonItemsDelegate:KeyboardToolbarDelegate?
    
    // MARK: - Utilities
    
    ///Default toolbar for displaying above keyboard. It doesn't have any buttons.
    public class func defaultToolBar() -> KeyboardToolbar {
        let toolbar = KeyboardToolbar(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 50))
        return toolbar
    }
    
    public class func defaultToolBarWithItems(items:[UIBarButtonItem]?) -> KeyboardToolbar {
        let toolbar   = defaultToolBar()
        toolbar.items = items
        return toolbar
    }
    
    /**
    Default toolbar with buttons specified for type. Different type has different buttons. Buttons have already assigned navigation functions.
    
    - parameter type: Type of keyboard toolbar to assign.
    */
    public class func keyboardToolbarForType(type:KeyboardToolbarType) -> KeyboardToolbar {
        let toolbar  = defaultToolBar()
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
        case .OnlyNext:
            items = [
                defaultNextBarButtonItem(),
                flexibleSpaceBarButtonItem(),
                defaultDoneBarButtonItem()
            ]
        case .OnlyNextText:
            items = [
                defaultNextBarButtonItemForTitle(Settings.nextTitle),
                flexibleSpaceBarButtonItem(),
                defaultDoneBarButtonItem()
            ]
        case .OnlyPrev:
            items = [
                defaultPreviousBarButtonItem(),
                flexibleSpaceBarButtonItem(),
                defaultDoneBarButtonItem()
            ]
        case .OnlyPrevText:
            items = [
                defaultPreviousBarButtonItemForTitle(Settings.previousTitle),
                flexibleSpaceBarButtonItem(),
                defaultDoneBarButtonItem()
            ]
        }
    }
    
    // MARK: - Actions
    
    func didSelectBarButtonItem(sender:UIBarButtonItem) {
        barButtonItemsDelegate?.keyboardToolbar(self, didSelectBarButtonItem: sender)
    }
}
