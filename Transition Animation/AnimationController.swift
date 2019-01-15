//
//  AnimationController.swift
//  Transition Animation
//
//  Created by Sahand Raeisi on 1/15/19.
//  Copyright © 2019 Sahand Raeisi. All rights reserved.
//

import UIKit

class AnimationController: NSObject {
    
    private let animationDuration: Double
    private let animationMode: AnimationMode
    
    enum AnimationMode {
        case present
        case dismiss
    }
    
    init(animationDuration: Double, animationMode: AnimationMode) {
        self.animationDuration = animationDuration
        self.animationMode = animationMode
    }
}

extension AnimationController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: animationDuration) ?? 0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toVC = transitionContext.viewController(forKey: .to),
              let fromVC = transitionContext.viewController(forKey: .from) else {
                transitionContext.completeTransition(false)
                return
        }
        
        switch animationMode {
            
        case .present:
            transitionContext.containerView.addSubview(toVC.view)
            presentAnimation(with: transitionContext, viewToAnimate: toVC.view)
        case .dismiss:
            transitionContext.containerView.addSubview(toVC.view)
            transitionContext.containerView.addSubview(fromVC.view)
            dismissAnimation(with: transitionContext, viewToAnimate: fromVC.view)
        }
    }
    
    func dismissAnimation(with transitionContext:UIViewControllerContextTransitioning, viewToAnimate:UIView) {
        
        let duration = transitionDuration(using: transitionContext)
        let transform = CGAffineTransform(translationX: -viewToAnimate.bounds.width, y: 0)
        
        
        UIView.animate(withDuration: duration, delay: 0.0, options: .transitionCurlUp, animations: {
            viewToAnimate.transform = transform
        }) { (success) in
            transitionContext.completeTransition(success)
        }
        
    }
    
    func presentAnimation(with transitionContext:UIViewControllerContextTransitioning, viewToAnimate:UIView) {
        
        viewToAnimate.clipsToBounds = true
        viewToAnimate.transform = CGAffineTransform(translationX: 0, y: -viewToAnimate.bounds.height)
            //CGAffineTransform(scaleX: 0, y: 0)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0.0,
                       usingSpringWithDamping: 0.80,
                       initialSpringVelocity: 0.1, options: .curveEaseInOut,
                       animations: {
                    viewToAnimate.transform = .identity
                        
        }) { (success) in
            transitionContext.completeTransition(success)
        }
    }

}

//        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: .calculationModeLinear, animations: {
//
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.7, animations: {
//                viewToAnimate.transform = scaleDown
//            })
//
//            UIView.addKeyframe(withRelativeStartTime: 2.0/duration, relativeDuration: 0.7, animations: {
//                viewToAnimate.transform = scaleDown.concatenating(moveOut)
//            })
//
//        }) { (success) in
//            transitionContext.completeTransition(success)
//        }
