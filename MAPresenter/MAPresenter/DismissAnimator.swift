//
//  DismissAnimator.swift
//  Contest
//
//  Created by Morshed Alam on 1/14/17.
//  Copyright © 2017 GagaGugu. All rights reserved.
//

import UIKit


class DismissAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!
        
        let animationDuration = self .transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
            
            fromViewController.view.transform = CGAffineTransform(translationX: 0, y: 1000)
        }, completion: { (finished) -> Void in
            fromViewController.view.alpha = 0.0
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
