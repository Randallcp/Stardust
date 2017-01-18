//
//  ViewController.swift
//  Stardust
//
//  Created by Randy Perecman on 1/17/17.
//  Copyright © 2017 Randy Perecman. All rights reserved.
//

import UIKit

class ToastViewController: UIViewController {

    // Outlets
    @IBOutlet weak var toastView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Design
        toastView.isHidden = true
        toastView.alpha = 0
        // toastView.backgroundColor = UIColor(colorLiteralRed: 45/255, green: 45/255, blue: 45/255, alpha: 0.75)
        toastView.layer.cornerRadius = 8
        messageLabel.textColor = UIColor.white
    }
    
    // Call make fading toast
    @IBAction func someAction(_ sender: UIButton) {
        makeFadingToast("This is a fading toast!")
    }
    
    // Call make perm toast
    @IBAction func otherAction(_ sender: UIButton) {
        makePermanentToast("This is a permanent toast!")
    }
    
    // X on perm toast pressed
    @IBAction func exitPressed(_ sender: UIButton) {
        exitPermanantToast()
    }
    
    // Creates fading toast
    func makeFadingToast(_ text: String) {
        
        self.exitButton.isHidden = true
        UIView.animate(withDuration: 0.7, animations: {
            self.toastView.isHidden = false
            self.messageLabel.text = text
            self.toastView.alpha = 1
        }, completion: { (completed) -> Void in
            UIView.animate(withDuration: 0.7, delay: 1.5, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
                self.toastView.alpha = 0
            }, completion: { (completed) -> Void in
                self.toastView.isHidden = true
            })
        })
        
    }
    
    // Creates perm toast
    func makePermanentToast(_ text: String) {
        self.exitButton.isHidden = false
        UIView.animate(withDuration: 0.7, animations: {
            self.toastView.isHidden = false
            self.messageLabel.text = text
            self.toastView.alpha = 1
        })
    }
    
    // Exits toast
    func exitPermanantToast() {
        UIView.animate(withDuration: 0.7, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
            self.toastView.alpha = 0
        }, completion: { (completed) -> Void in
            self.toastView.isHidden = true
        })
    }
    
}

