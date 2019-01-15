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
        
    }

}
