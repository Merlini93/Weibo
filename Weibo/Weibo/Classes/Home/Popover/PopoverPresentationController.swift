//
//  PopoverPresentationController.swift
//  Weibo
//
//  Created by 李遨东 on 16/9/9.
//  Copyright © 2016年 Merlini. All rights reserved.
//

import UIKit

class PopoverPresentationController: UIPresentationController {
    
    var presentFrame = CGRectZero
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
    
    override func containerViewWillLayoutSubviews() {
        if presentFrame == CGRectZero {
            presentedView()?.frame = CGRect(x: 100, y: 56, width: 200, height: 200)
        } else {
            presentedView()?.frame = presentFrame
        }
        containerView?.insertSubview(cover, atIndex: 0)
    }
    
    
    
    private lazy var cover: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        view.frame = UIScreen.mainScreen().bounds
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(close))
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    func close() {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
