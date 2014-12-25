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
        let formNavigationManager = FormNavigationManager()
        formNavigationManager.addTextField(textfield1)
        formNavigationManager.addTextField(textfield2)
        formNavigationManager.addTextView(textview1)
    }
}
