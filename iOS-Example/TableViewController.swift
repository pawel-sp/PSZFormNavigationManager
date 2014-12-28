//
//  TableViewController.swift
//  iOS-Example
//
//  Created by Paweł Sporysz on 28.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit
import PSZFormNavigationManager

class TableViewController: UITableViewController {

    // MARK: - Settings
    
    struct Settings {
        static let exampleSegueName       = "showExample"
        static let customExampleSegueName = "customExample"
    }
    
    // MARK: - Navigation
    
    var selectedKeyboardToolbarType:KeyboardToolbarType = .Default
    
    // MARK: - Navigation
    
    func showExampleForKeyboardToolbarType(keyboardToolbarType:KeyboardToolbarType) {
        selectedKeyboardToolbarType = keyboardToolbarType
        var segueName = ""
        switch keyboardToolbarType {
        case .Custom: segueName = Settings.customExampleSegueName
        default:      segueName = Settings.exampleSegueName
        }
        performSegueWithIdentifier(segueName, sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Settings.exampleSegueName {
            if let target = segue.destinationViewController as? ExampleViewController {
                target.selectedKeyboardToolBarType = selectedKeyboardToolbarType
            }
        }
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:     showExampleForKeyboardToolbarType(.Default)
        case 1:     showExampleForKeyboardToolbarType(.Text)
        case 2:     showExampleForKeyboardToolbarType(.DefaultCentered)
        case 3:     showExampleForKeyboardToolbarType(.TextCentered)
        case 4:     showExampleForKeyboardToolbarType(.Custom)
        default:    break
        }
    }
    
}
