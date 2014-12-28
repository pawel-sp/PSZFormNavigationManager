//
//  FormNavigationManagerDelegate.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 28.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import Foundation

public protocol FormNavigationManagerDelegate {
    
     func formNavigationManager(formNavigationManager:FormNavigationManager, keyboardToolbarItemsForInputField inputField:InputFieldProtocol) -> [AnyObject]?
    
}