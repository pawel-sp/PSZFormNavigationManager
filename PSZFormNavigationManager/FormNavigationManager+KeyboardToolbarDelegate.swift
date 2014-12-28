//
//  FormNavigationManager+KeyboardToolbarDelegate.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 26.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit

extension FormNavigationManager:KeyboardToolbarDelegate {
    
    func keyboardToolbar(keyboardToolbar: KeyboardToolbar, didSelectBarButtonItem barButtonItem: UIBarButtonItem) {
        
        switch barButtonItem.tag {
        case KeyboardToolBarButtonItemType.Previous.rawValue:
            break
        case KeyboardToolBarButtonItemType.Next.rawValue:
            break
        case KeyboardToolBarButtonItemType.Done.rawValue:
            break
        default:
            break
        }
    }
    
}
