//
//  TransitionAnimator.swift
//  Contest
//
//  Created by Morshed Alam on 1/14/17.
//  Copyright © 2017 GagaGugu. All rights reserved.
//

import UIKit



class PresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as! SecondViewController
        let containerView = transitionContext.containerView
        
        let animationDuration = self.transitionDuration(using: transitionContext)
        toViewController.view.transform = CGAffineTransform(translationX: 0, y: 1000)
        toViewController.view.layer.cornerRadius = 8.0
        toViewController.view.clipsToBounds = true
        containerView.addSubview(toViewController.view)
        
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
            toViewController.view.transform = CGAffineTransform.identity
        }, completion: { (finished) -> Void in
            transitionContext.completeTransition(finished)
        })
    }
    
    
    
    
}
