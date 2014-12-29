//
//  FormNavigationManager+KeyboardToolbarDelegate.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 26.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit

extension FormNavigationManager:KeyboardToolbarDelegate {
    
    /**
    Invokes every time when bar button item from keyboard toolbar is pressed.
    
    :param: keyboardToolbar Current toolbar displayed over the keyboard.
    :param: barButtonItem   Pressed bar button item.
    */
    func keyboardToolbar(keyboardToolbar: KeyboardToolbar, didSelectBarButtonItem barButtonItem: UIBarButtonItem) {
        switch barButtonItem.tag {
        case KeyboardToolBarButtonItemType.Previous.rawValue:
            moveToPreviousInputField()
        case KeyboardToolBarButtonItemType.Next.rawValue:
            moveToNextInputField()
        case KeyboardToolBarButtonItemType.Done.rawValue:
            finishNavigation()
        default:
            break
        }
    }
    
}
