//
//  FormNavigationManager.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 24.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit

public class FormNavigationManager: NSObject {
   
    // MARK: - Settings
    
    /// Infinite navigation means that after typing next button when last input field is active, the first input field become active. It works the same in different direction. Default value = true.
    public var infiniteNavigation:Bool = true
    
    // MARK: - Properties
    
    /// Delegate. You can use it to display different keyboard toolbar according to active input field.
    public var delegate:FormNavigationManagerDelegate? {
        didSet {
            assignKeyboardToolbarFromDelegate()
        }
    }
    
    /// Assigned input fields, for example UITextField, UITextView.
    public var inputFields:[InputFieldProtocol] = []
    
    /// Assigned keyboard toolbar.
    public var keyboardToolBar:KeyboardToolbar?
    
    // MARK: - Utilities
    
    func assignKeyboardToolbarFromDelegate() {
        if delegate != nil {
            for inputField in inputFields {
                var _inputField                         = inputField
                let keyboardToolbar                     = delegate?.formNavigationManager(self, keyboardToolbarForInputField: _inputField)
                keyboardToolbar?.barButtonItemsDelegate = self
                _inputField.inputAccessoryView          = keyboardToolbar
            }
        }
    }
    
    func assignKeyboardToolbar(keyboardToolbar:KeyboardToolbar) {
        for inputField in inputFields {
            var _inputField                = inputField
            _inputField.inputAccessoryView = keyboardToolBar
        }
    }
    
    /**
    Use this function to register input fields. It causes for every input field there will be specified keyboard toolbar displayed.
    
    :param: inputFields     Input fields to register. It can be UITextField, UITextView or any other object which implement InputProtocol.
    :param: keyboardToolBar Keyboard toolbar to register.
    */
    public func registerInputFields(inputFields:[InputFieldProtocol], forKeyboardToolBar keyboardToolBar:KeyboardToolbar) {
        
        self.keyboardToolBar                   = keyboardToolBar
        keyboardToolBar.barButtonItemsDelegate = self
        self.inputFields                       = inputFields
        
        if delegate != nil {
            assignKeyboardToolbarFromDelegate()
        } else {
            assignKeyboardToolbar(keyboardToolBar)
        }
    }
    
    func neighboringInputFieldsFrom(#inputField:InputFieldProtocol?) -> (InputFieldProtocol?,InputFieldProtocol?) {
        let count = inputFields.count
        for (index,element) in enumerate(inputFields) {
            if element.isEqual(inputField) {
                switch index {
                case 0:         return (infiniteNavigation ? inputFields.last : nil, index + 1 < count ? inputFields[index+1] : inputFields.first)
                case count - 1: return (index - 1 >= 0 ? inputFields[index-1] : inputFields.last ,infiniteNavigation ? inputFields.first : nil)
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
