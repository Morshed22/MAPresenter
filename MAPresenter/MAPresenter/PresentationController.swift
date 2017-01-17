//
//  PresentationController.swift
//  Contest
//
//  Created by Morshed Alam on 1/14/17.
//  Copyright © 2017 GagaGugu. All rights reserved.
//

import UIKit



class PresentationController: UIPresentationController {
    
    var dimmingView: UIView!
    let height = CGFloat(Float(64 * 5.5))
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        setupDimmingView()
    }
    
    func setupDimmingView() {
        dimmingView = UIView(frame: presentingViewController.view.bounds)
        
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark)) as UIVisualEffectView
        visualEffectView.frame = dimmingView.bounds
        visualEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        dimmingView.addSubview(visualEffectView)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(PresentationController.dimmingViewTapped(_:)))
        dimmingView.addGestureRecognizer(tapRecognizer)
    }
    
    func dimmingViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true, completion: nil)
    }
    
    override func presentationTransitionWillBegin() {
        let containerView = self.containerView
        let presentedViewController = self.presentedViewController
        
        dimmingView.frame = containerView!.bounds
        dimmingView.alpha = 0.0
        
        containerView!.insertSubview(dimmingView, at: 0)
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (coordinatorContext) -> Void in
            self.dimmingView.alpha = 0.9
        }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (coordinatorContext) -> Void in
            self.dimmingView.alpha = 0.0
        }, completion: nil)
    }
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        dimmingView.frame = containerView!.bounds
        presentedView!.frame = frameOfPresentedViewInContainerView
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width - 40.0, height: height)
        
    }
    
    override var frameOfPresentedViewInContainerView : CGRect {
        var presentedViewFrame = CGRect.zero
        let containerBounds = containerView!.bounds
        let contentContainer = presentedViewController
        presentedViewFrame.size = size(forChildContentContainer: contentContainer, withParentContainerSize: containerBounds.size)
        presentedViewFrame.origin.x = 20.0
        let gapPoint = self.dimmingView.frame.height - (height + 100)
        presentedViewFrame.origin.y =  gapPoint
        return presentedViewFrame
    }
}
