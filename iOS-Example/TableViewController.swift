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
        static let exampleSegueName        = "showExample"
        static let customExampleSegueName  = "customExample"
        static let dynamicExampleSegueName = "dynamicExample"
    }
    
    // MARK: - Navigation
    
    var selectedKeyboardToolbarType:KeyboardToolbarType = .Default
    
    // MARK: - Navigation
    
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
        case 0:
            selectedKeyboardToolbarType = .Default
            performSegueWithIdentifier(Settings.exampleSegueName, sender: nil)
        case 1:
            selectedKeyboardToolbarType = .Text
            performSegueWithIdentifier(Settings.exampleSegueName, sender: nil)
        case 2:
            selectedKeyboardToolbarType = .DefaultCentered
            performSegueWithIdentifier(Settings.exampleSegueName, sender: nil)
        case 3:
            selectedKeyboardToolbarType = .TextCentered
            performSegueWithIdentifier(Settings.exampleSegueName, sender: nil)
        case 4:
            performSegueWithIdentifier(Settings.customExampleSegueName, sender: nil)
        case 5:
            performSegueWithIdentifier(Settings.dynamicExampleSegueName, sender: nil)
        default:
            break
        }
    }
    
}
