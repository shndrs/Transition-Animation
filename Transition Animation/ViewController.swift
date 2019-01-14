//
//  ViewController.swift
//  Transition Animation
//
//  Created by Sahand Raeisi on 1/14/19.
//  Copyright © 2019 Sahand Raeisi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    private var isFlipped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstViewAction()
        
    }
    
    func firstViewAction() {
        let firstTap = UITapGestureRecognizer(target: self, action: #selector(firstViewGesture(tap:)))
        let secondTap = UITapGestureRecognizer(target: self, action: #selector(firstViewGesture(tap:)))
        firstView.addGestureRecognizer(firstTap)
        secondView.addGestureRecognizer(secondTap)
    }

    @objc fileprivate func firstViewGesture(tap: UITapGestureRecognizer) {
        isFlipped = !isFlipped
        let fromView = isFlipped ? firstView:secondView
        let toView = isFlipped ? secondView:firstView
        let animationTranstion:UIView.AnimationOptions = isFlipped ? .transitionCurlUp:.transitionCurlDown
        UIView.transition(from: fromView!, to: toView!, duration: 0.5, options: [animationTranstion, .showHideTransitionViews])
    }
}

