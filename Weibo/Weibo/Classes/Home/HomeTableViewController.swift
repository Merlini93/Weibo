//
//  HomeTableViewController.swift
//  Weibo
//
//  Created by 李遨东 on 16/9/8.
//  Copyright © 2016年 Merlini. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = UIColor.blueColor()
        
        
        if !userLogin {
            visitorView?.setupVisitorInfo(true, imageName: "visitordiscover_feed_image_house    ", message: "关注一些人，回这里看看有什么惊喜?")
            return
        }
        
        setupNavi()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(change), name: kPopoverAnimatorWillShow, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(change), name: kPopoverAnimatorWillDismiss, object: nil)
    }
    
    func change(noti:NSNotification) {
        let title = navigationItem.titleView as! TitleButton
        title.selected = !title.selected
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    private func setupNavi(){
        navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButtonItem("navigationbar_friendattention",target: self,action: NSSelectorFromString("leftClick"))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.createBarButtonItem("navigationbar_pop",target: self, action: NSSelectorFromString("rightClick"))
        
        let titlebtn = TitleButton()
        titlebtn.setTitle("我是你爹 ", forState: UIControlState.Normal)
        titlebtn.addTarget(self, action: #selector(titleClick), forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.titleView = titlebtn
    }
    
    func titleClick(sender: UIButton) {
//        sender.selected = !sender.selected
        let sb = UIStoryboard(name: "PopoverViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        
        vc?.transitioningDelegate = animator
        vc?.modalPresentationStyle = UIModalPresentationStyle.Custom
        presentViewController(vc!, animated: true, completion: nil)
    }
    
    func leftClick() {
        print("点击左边导航栏")
    }
    
    func rightClick() {
        print("点击右边导航栏")
    }
    
    private lazy var animator: PopoverAnimator = {
        let animator = PopoverAnimator()
        animator.presentFrame = CGRect(x: 100, y: 56, width: 200, height: 350)
        return animator
    }()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
}













