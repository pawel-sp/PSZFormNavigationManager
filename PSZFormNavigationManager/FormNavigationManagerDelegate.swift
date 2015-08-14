//
//  FormNavigationManagerDelegate.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 28.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import Foundation

public protocol FormNavigationManagerDelegate {
    
    /**
    That function can be used to return different keyboard toolbar for every input field. You must assign delegate first.
    
    - parameter formNavigationManager: Current instance of form navigation manager.
    - parameter inputField:  Instance of input field to return keyboard toolbar.
    */
    func formNavigationManager(formNavigationManager:FormNavigationManager, keyboardToolbarForInputField inputField:InputFieldProtocol) -> KeyboardToolbar?
    
}