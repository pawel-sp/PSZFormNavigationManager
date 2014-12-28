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
    
    @IBOutlet weak var infiniteNavigationSwitch: UISwitch!
    
    // MARK: - Properties
    
    lazy var manager:FormNavigationManager = {
        let manager = FormNavigationManager()
        manager.infiniteNavigation = self.infiniteNavigationSwitch.on
        return manager
        }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup
    
    func setup() {
        manager.registerInputFields([textfield1,textfield2,textview1], forKeyboardToolBar:KeyboardToolbar.keyboardToolbarForType(.Default))
    }
    
    // MARK: - Actions
    
    @IBAction func infiniteNavigationValueChangedAction(sender: UISwitch) {
        manager.infiniteNavigation = sender.on
    }
}
