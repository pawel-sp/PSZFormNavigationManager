//
//  InputFieldProtocol.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 26.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import Foundation

public protocol InputFieldProtocol:NSObjectProtocol {
    
    //this protocol is used only to set common protocol with inputAccessoryView for UITextField and UITextView
    
    var inputAccessoryView:UIView? { get set }
    func becomeFirstResponder() -> Bool
    func resignFirstResponder() -> Bool
    
}