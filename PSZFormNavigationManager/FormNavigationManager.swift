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
    
    public var inputFieldControllers:[UIResponder] = []
    
    // MARK: - Utilities
    
    func addInputField(inputField:UIResponder) {
        if !contains(inputFieldControllers, inputField) {
            inputFieldControllers.append(inputField)
        }
    }
    
    public func addTextField(textField:UITextField) {
        addInputField(textField)
    }
    
    public func addTextView(textView:UITextView) {
        addInputField(textView)
    }
    
}
