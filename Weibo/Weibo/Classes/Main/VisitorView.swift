//
//  VisitorView.swift
//  Weibo
//
//  Created by 李遨东 on 16/9/8.
//  Copyright © 2016年 Merlini. All rights reserved.
//

import UIKit

class VisitorView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.whiteColor()
        addSubview(iconView)
        addSubview(homeIcon)
        addSubview(messageLabel)
        addSubview(loginBtn)
        addSubview(registerBtn)
    }
    
    override func layoutSubviews() {
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height
        
        iconView.center = CGPointMake(width / 2, height / 2)
        homeIcon.center = CGPointMake(width / 2, height / 2)
        let iconFrame = iconView.frame
        let rect = CGRect(x: 0, y: CGRectGetMaxY(iconFrame), width: width, height: 44)
        messageLabel.frame = rect
        
        let rx = CGRectGetMinX(iconFrame)
        let ry = CGRectGetMaxY(rect) + 10
        let rwidth = iconFrame.size.width / 2.0 - 15
        let registerFrame = CGRect(x: rx, y: ry, width: rwidth, height: 44)
        registerBtn.frame = registerFrame
        
        let lframe = CGRect(x: CGRectGetMaxX(registerFrame) + 30, y: ry, width: rwidth, height: 44)
        loginBtn.frame = lframe
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupVisitorInfo(isHome:Bool, imageName: String, message: String) {
        iconView.hidden = !isHome
        if iconView.hidden {
            homeIcon.image = UIImage(named: imageName)
            messageLabel.text = message
        } else {
            startAnimation()
        }
    }
    
    private func startAnimation(){
        let ani = CABasicAnimation(keyPath: "transform.rotation")
        ani.toValue = 2 * M_PI
        ani.duration = 20
        ani.repeatCount = MAXFLOAT
        ani.removedOnCompletion = false
        
        iconView.layer.addAnimation(ani, forKey: nil)
    }
    
    private lazy var iconView: UIImageView = {
        let iconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return iconView
    }()
    
    private lazy var homeIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return icon
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.Center
        label.text = "关注一些人，回这里看有什么惊喜"
        label.textColor = UIColor.grayColor()
        return label
    }()
    
    private lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("登录", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        btn.addTarget(self, action: #selector(loginClick), forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
    
    func loginClick(sender: UIButton) {
        print("登录")
    }
    
    private lazy var registerBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("注册", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        btn.addTarget(self, action: #selector(regClick), forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()

    
    func regClick(sender: UIButton) {
        print("注册")
        
    }
    
    private lazy var bgView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return imageView
    }()
    
}
