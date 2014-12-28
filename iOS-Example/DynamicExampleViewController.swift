//
//  DynamicExampleViewController.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 28.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit
import PSZFormNavigationManager

class DynamicExampleViewController: UIViewController, FormNavigationManagerDelegate {

    // MARK: - Outlets
    
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    
    func setup() {
        let manager = FormNavigationManager()
        manager.registerInputFields([textfield1,textfield2], forKeyboardToolBar: KeyboardToolbar.defaultToolBar())
        manager.delegate = self
    }
    
    // MARK: - FormNavigationManagerDelegate
    
    func formNavigationManager(formNavigationManager: FormNavigationManager, keyboardToolbarItemsForInputField inputField: InputFieldProtocol) -> [AnyObject]? {
        if let keyboardToolbar = formNavigationManager.keyboardToolBar {
            if inputField.isEqual(textfield1) {
                return [
                    keyboardToolbar.defaultNextBarButtonItem(),
                    keyboardToolbar.flexibleSpaceBarButtonItem(),
                    keyboardToolbar.defaultDoneBarButtonItem()
                ]
            } else if inputField.isEqual(textfield2) {
                return [
                    keyboardToolbar.defaultPreviousBarButtonItem(),
                    keyboardToolbar.flexibleSpaceBarButtonItem(),
                    keyboardToolbar.defaultDoneBarButtonItem()
                ]
            }
        }
        return nil
    }
}
