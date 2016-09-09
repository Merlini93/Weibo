//
//  PopoverAnimator.swift
//  Weibo
//
//  Created by 李遨东 on 16/9/9.
//  Copyright © 2016年 Merlini. All rights reserved.
//

import UIKit

let kPopoverAnimatorWillShow = "PopoverAnimatorWillShow"
let kPopoverAnimatorWillDismiss = "PopoverAnimatorWillDismiss"

class PopoverAnimator: NSObject, UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning{
    var isPresent: Bool = false
    var presentFrame = CGRectZero
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?{
        let pc = PopoverPresentationController(presentedViewController: presented, presentingViewController: presenting)
        pc.presentFrame = presentFrame
        return pc
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        NSNotificationCenter.defaultCenter().postNotificationName(kPopoverAnimatorWillShow, object: self)
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        NSNotificationCenter.defaultCenter().postNotificationName(kPopoverAnimatorWillDismiss, object: self)
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        if isPresent {
            let view = transitionContext.viewForKey(UITransitionContextToViewKey)
            transitionContext.containerView()?.addSubview(view!)
            view?.transform = CGAffineTransformMakeScale(1.0, 0.0)
            view?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                view?.transform = CGAffineTransformIdentity
            }) { (_) in
                transitionContext.completeTransition(true)
            }
        } else {
            let view = transitionContext.viewForKey(UITransitionContextFromViewKey)
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
                view?.transform = CGAffineTransformMakeScale(1.0, 0.01)
                }, completion: { (_) in
                    transitionContext.completeTransition(true)
            })
        }
        
    }
}
