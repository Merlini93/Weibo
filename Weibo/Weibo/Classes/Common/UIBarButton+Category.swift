//
//  UIBarButton+Category.swift
//  Weibo
//
//  Created by 李遨东 on 16/9/9.
//  Copyright © 2016年 Merlini. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    class func createBarButtonItem(imageName:String, target:AnyObject?, action:Selector) -> UIBarButtonItem {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        btn.sizeToFit()
        return UIBarButtonItem(customView: btn)
    }
}
