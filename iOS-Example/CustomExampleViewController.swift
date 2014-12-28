//
//  CustomExampleViewController.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 28.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit
import PSZFormNavigationManager

class CustomExampleViewController: UIViewController {

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
        let manager           = FormNavigationManager()
        let keyboardToolbar   = KeyboardToolbar.defaultToolBar()
        keyboardToolbar.items = [
            keyboardToolbar.defaultDoneBarButtonItemForTitle("OK"),
            keyboardToolbar.flexibleSpaceBarButtonItem(),
            keyboardToolbar.defaultPreviousBarButtonItemForTitle("<<"),
            keyboardToolbar.defaultNextBarButtonItemForTitle(">>")
        ]
        
        manager.registerInputFields([textfield1,textfield2], forKeyboardToolBar: keyboardToolbar)
    }
}
