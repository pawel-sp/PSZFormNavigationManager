//
//  UIBarButtonItem+PSZFormNavigationForm.swift
//  PSZFormNavigationManager
//
//  Created by Paweł Sporysz on 26.12.2014.
//  Copyright (c) 2014 Paweł Sporysz. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    /// Returns default bar button item with flexible space
    public class func flexibleSpaceBarButtonItem() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
    }
    
    /**
    Returns bar button item with specified parameters.
    
    :param: title  Title to display inside bar button item.
    :param: target Target
    :param: action Action
    :param: tag    Tag
    
    */
    public class func barButtonItemForTitle(title:String?, target:AnyObject?, action:Selector, andTag tag:Int) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(title: title, style: UIBarButtonItemStyle.Bordered, target: target, action: action)
        barButtonItem.tag = tag
        return barButtonItem
    }
}
