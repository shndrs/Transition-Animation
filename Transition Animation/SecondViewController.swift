//
//  SecondViewController.swift
//  Transition Animation
//
//  Created by Sahand Raeisi on 1/15/19.
//  Copyright © 2019 Sahand Raeisi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        transitioningDelegate = self
    }
    
    @IBAction private func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension SecondViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        
        return AnimationController(animationDuration: 1.0, animationMode: .present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 0.5, animationMode: .dismiss)
    }
}
