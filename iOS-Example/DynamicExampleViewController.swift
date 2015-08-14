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
        view.backgroundColor = UIColor.whiteColor()
        
        let manager = FormNavigationManager()
        manager.registerInputFields([textfield1,textfield2], forKeyboardToolBar: KeyboardToolbar.defaultToolBar())
        manager.delegate = self
    }
    
    func colorBarButtonItem() -> UIBarButtonItem {
        return UIBarButtonItem(title: "Color", style: UIBarButtonItemStyle.Plain, target: self, action: "changeBackgroundColor")
    }
    
    // MARK: - Action 
    
    func changeBackgroundColor() {
        view.backgroundColor = view.backgroundColor == UIColor.whiteColor() ? UIColor.lightGrayColor() : UIColor.whiteColor()
    }
    
    // MARK: - FormNavigationManagerDelegate
 
    func formNavigationManager(formNavigationManager: FormNavigationManager, keyboardToolbarForInputField inputField: InputFieldProtocol) -> KeyboardToolbar? {
        if let keyboardToolbar = formNavigationManager.keyboardToolBar {
            if inputField.isEqual(textfield1) {
                return KeyboardToolbar.defaultToolBarWithItems([
                    keyboardToolbar.defaultNextBarButtonItem(),
                    keyboardToolbar.flexibleSpaceBarButtonItem(),
                    colorBarButtonItem(),
                    keyboardToolbar.flexibleSpaceBarButtonItem(),
                    keyboardToolbar.defaultDoneBarButtonItem()
                ])
            } else if inputField.isEqual(textfield2) {
                return KeyboardToolbar.defaultToolBarWithItems([
                    keyboardToolbar.defaultPreviousBarButtonItem(),
                    keyboardToolbar.flexibleSpaceBarButtonItem(),
                    colorBarButtonItem(),
                    keyboardToolbar.flexibleSpaceBarButtonItem(),
                    keyboardToolbar.defaultDoneBarButtonItem()
                ])
            }
        }
        return nil
    }
}
