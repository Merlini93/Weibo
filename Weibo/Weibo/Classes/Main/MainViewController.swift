//
//  MainViewController.swift
//  Weibo
//
//  Created by 李遨东 on 16/9/8.
//  Copyright © 2016年 Merlini. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor.orangeColor()
        let path:String? = NSBundle.mainBundle().pathForResource("MainVCSettings", ofType: "json")
        if let jsonpath = path {
            let jsonData = NSData(contentsOfFile: jsonpath)
            
            do {
                let dictArr = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers)
//                print(dictArr)
            } catch {
                print(error)
            }
        }
        
        addChildViewController(HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        addChildViewController(NullViewController(), title: "", imageName: "")
        addChildViewController(DiscoverTableViewController(), title: "广场", imageName: "tabbar_discover")
        addChildViewController(ProfileTableViewController(), title: "我", imageName: "tabbar_profile")
    }
    
    private func addChildViewController(childController: UIViewController, title:String, imageName: String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: "\(imageName)_highlighted")
        childController.title = title
        let navi = UINavigationController()
        navi.addChildViewController(childController)
        addChildViewController(navi)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupComposeBtn()
    }
    
    func setupComposeBtn() {
        tabBar.addSubview(composeBtn)
        let width = UIScreen.mainScreen().bounds.size.width / CGFloat(viewControllers!.count)
        let rect = CGRect(x: 0, y: 0, width: width, height: 49)
        composeBtn.frame = CGRectOffset(rect, 2 * width, 0)
        tabBar.bringSubviewToFront(composeBtn)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - lazy
    private lazy var composeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"tabbar_compose_icon_add"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), forState: UIControlState.Highlighted)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        btn.addTarget(self, action: #selector(composeBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        
        return btn
    }()
    
    func composeBtnClick(sender:UIButton) {
        print(sender)
    }
}
