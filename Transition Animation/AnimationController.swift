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
            <#code#>
        }
    }
    
    func presentAnimation(with transitionContext:UIViewControllerContextTransitioning, viewToAnimate:UIView) {
        
        viewToAnimate.clipsToBounds = true
        viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0.0,
                       usingSpringWithDamping: 0.80,
                       initialSpringVelocity: 0.1, options: .curveEaseInOut,
                       animations: {
                    viewToAnimate.transform = .identity
                        //CGAffineTransform(scaleX: 1.0, y: 1.0)
                        
        }) { (success) in
            transitionContext.completeTransition(success)
        }
    }

}
