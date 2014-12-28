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
    
    public func registerInputFields(inputFields:[InputFieldProtocol], forKeyboardToolBar keyboardToolBar:KeyboardToolbar) {
        
        self.inputFields                       = inputFields
        keyboardToolBar.barButtonItemsDelegate = self
        
        for inputField in inputFields {
            var _inputField                = inputField
            _inputField.inputAccessoryView = keyboardToolBar
        }
    }
    
    func neighboringInputFieldsFrom(#inputField:InputFieldProtocol?) -> (InputFieldProtocol?,InputFieldProtocol?) {
        let count = inputFields.count
        for (index,element) in enumerate(inputFields) {
            if element.isEqual(inputField) {
                switch index {
                case 0:         return (inputFields.last,inputFields[index+1])
                case count - 1: return (inputFields[index-1],inputFields.first)
                default:        return (inputFields[index-1],inputFields[index+1])
                }
            }
        }
        return (nil,nil)
    }
    
    func activeInputField() -> InputFieldProtocol? {
        let currentFirstResponder = UIResponder.currentFirstResponder()
        return inputFields.filter{ $0.isEqual(currentFirstResponder) }.first
    }
    
    // MARK: - Navigation
    
    func moveToNextInputField() {
        if let activeInputField = activeInputField() {
            activeInputField.resignFirstResponder()
            neighboringInputFieldsFrom(inputField: activeInputField).1?.becomeFirstResponder()
        }
    }
    
    func moveToPreviousInputField() {
        if let activeInputField = activeInputField() {
            activeInputField.resignFirstResponder()
            neighboringInputFieldsFrom(inputField: activeInputField).0?.becomeFirstResponder()
        }
    }
    
    func finishNavigation() {
        activeInputField()?.resignFirstResponder()
    }
    
}
