//
//  FormNavigationManager.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 24.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit

public class FormNavigationManager: NSObject {
   
    // MARK: - Properties
    
    public var inputFields:[InputFieldProtocol] = []
    
    // MARK: - Utilities
    
    public func registerInputFields(inputFields:[InputFieldProtocol], forKeyboardToolBarType keyboardToolBar:KeyboardToolbar) {
        
        self.inputFields                       = inputFields
        keyboardToolBar.barButtonItemsDelegate = self
        
        for a in inputFields {
            var b = a
            b.inputAccessoryView = keyboardToolBar
        }
    }
    
}
