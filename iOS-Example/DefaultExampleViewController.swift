//
//  DefaultExampleViewController.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 25.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit
import PSZFormNavigationManager

class DefaultExampleViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var textview1: UITextView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    
    func setup() {
        let manager = FormNavigationManager()
        manager.infiniteNavigation = false
        manager.registerInputFields([textfield1,textfield2,textview1], forKeyboardToolBar:KeyboardToolbar.keyboardToolbarForType(.Default))
    }
}
