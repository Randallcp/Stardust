//
//  ModalViewController.swift
//  Stardust
//
//  Created by Randy Perecman on 1/17/17.
//  Copyright © 2017 Randy Perecman. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    // Outlets
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var gotitButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var modalTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Design
        // modalView.backgroundColor = UIColor.white
        modalView.layer.cornerRadius = 10
        gotitButton.layer.cornerRadius = 10
        //  gotitButton.setTitleColor(UIColor.white, for: UIControlState())
        //  gotitButton.backgroundColor = UIColor(colorLiteralRed: 185/255, green: 26/255, blue: 139/255, alpha: 1)
        //  messageLabel.textColor = UIColor.darkGray
    }
    
    // Show modal button pressed
    @IBAction func showModalPressed(_ sender: UIButton) {
        showModal(text: "Stardust is awesome!")
    }
    
    // When the button on modal is pressed:
    @IBAction func buttonPressed(_ sender: UIButton) {
        hideModal()
    }
    
    
    // Animation for hiding modal
    func hideModal() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.3, animations: {
            self.modalTopConstraint.constant += self.view.bounds.height
            self.view.layoutIfNeeded()
        }, completion: { (finished: Bool) in
            if finished {
                self.modalView.isHidden = true
                //                self.shadowView.hidden = true
                self.modalTopConstraint.constant -= self.view.bounds.height
            }
        })
    }
    
    // Animation for showing modal
    func showModal(text: String) {
        messageLabel.text = text
        modalTopConstraint.constant += self.view.bounds.height
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: {
            self.modalView.isHidden = false
            //            self.shadowView.hidden = false
            self.modalTopConstraint.constant -= self.view.bounds.height
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
