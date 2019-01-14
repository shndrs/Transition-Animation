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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstViewAction()
        secondViewAction()
    }
    
    
    func firstViewAction() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(firstViewGesture(tap:)))
        firstView.addGestureRecognizer(tap)
    }
    func secondViewAction() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(secondViewGesture(tap:)))
        secondView.addGestureRecognizer(tap)
    }

    @objc fileprivate func firstViewGesture(tap: UITapGestureRecognizer) {
        UIView.transition(from: firstView, to: secondView, duration: 0.5, options: .transitionFlipFromLeft)
    }

    @objc fileprivate func secondViewGesture(tap: UITapGestureRecognizer) {
        
    }
}

