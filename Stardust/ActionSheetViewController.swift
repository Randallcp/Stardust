//
//  ActionSheetViewController.swift
//  Stardust
//
//  Created by Randy Perecman on 1/17/17.
//  Copyright © 2017 Randy Perecman. All rights reserved.
//

import UIKit

class ActionSheetViewController: UIViewController {

    // Outlets
    @IBOutlet weak var actionSheetView: UIView!
    @IBOutlet weak var actionSheetLabel: UILabel!
    @IBOutlet weak var actionSheetOptionButton1: UIButton!
    @IBOutlet weak var actionSheetOptionButton2: UIButton!
    @IBOutlet weak var actionSheetOptionButton3: UIButton!
    @IBOutlet weak var actionSheetBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Design
        actionSheetView.layer.cornerRadius = 10
        actionSheetOptionButton1.layer.cornerRadius = 10
        actionSheetOptionButton2.layer.cornerRadius = 10
        actionSheetOptionButton3.layer.cornerRadius = 10
    }

    // Action that calls makeActionSheet()
    @IBAction func showSheetPressed(_ sender: UIButton) {
        makeActionSheet(text: "What would you like to do?", option1: "Hide from my feed", option2: "Block user", option3: "Report post")
    }

    // Creates action sheet with info inputted, animates it in
    func makeActionSheet(text: String, option1: String, option2: String, option3: String) -> Void {
        
        self.actionSheetLabel.text = text
        self.actionSheetOptionButton1.setTitle(option1, for: .normal)
        self.actionSheetOptionButton2.setTitle(option2, for: .normal)
        self.actionSheetOptionButton3.setTitle(option3, for: .normal)
        // Sets up event listeners
        self.actionSheetOptionButton1.addTarget(self, action: #selector(ActionSheetViewController.buttonClicked(_:)), for: .touchUpInside)
        self.actionSheetOptionButton2.addTarget(self, action: #selector(ActionSheetViewController.buttonClicked(_:)), for: .touchUpInside)
        self.actionSheetOptionButton3.addTarget(self, action: #selector(ActionSheetViewController.buttonClicked(_:)), for: .touchUpInside)
    
        actionSheetBottomConstraint.constant -= self.view.bounds.height
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: {
            self.actionSheetView.isHidden = false
            self.actionSheetBottomConstraint.constant += self.view.bounds.height
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    // Function called on event listener:
        // 1. Animates color
        // 2. Hides sheet
        // 3. Depending on what button was pressed, do something **custom for each app**
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            sender.setTitleColor(UIColor.white, for: .normal)
            sender.backgroundColor = UIColor(colorLiteralRed: 50/255, green: 245/255, blue: 205/255, alpha: 1)
        }, completion: { (completed) -> Void in
            UIView.animate(withDuration: 0.7, delay: 1, options: UIViewAnimationOptions.curveEaseOut, animations: { () -> Void in
            }, completion: { (completed) -> Void in
                self.hideSheet()
            })
        })

        if sender == self.actionSheetOptionButton1 {
            print("1")
        }
        else if sender == self.actionSheetOptionButton2 {
            print("2")
        }
        else if sender == self.actionSheetOptionButton3 {
            print("3")
            
        }
    }
    
    // Hides action sheet
    func hideSheet() {
        UIView.animate(withDuration: 0.5, animations: {
            self.actionSheetBottomConstraint.constant -= self.view.bounds.height
            self.view.layoutIfNeeded()

        }, completion: { (finished: Bool) in
            if finished {
                
                self.actionSheetView.isHidden = true
                self.actionSheetBottomConstraint.constant += self.view.bounds.height
                self.actionSheetOptionButton1.setTitleColor(UIColor(colorLiteralRed: 0/255, green: 153/255, blue: 255/255, alpha: 1), for: .normal)
                self.actionSheetOptionButton1.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 0.9)
                self.actionSheetOptionButton2.setTitleColor(UIColor(colorLiteralRed: 0/255, green: 153/255, blue: 255/255, alpha: 1), for: .normal)
                self.actionSheetOptionButton2.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 0.9)
                self.actionSheetOptionButton3.setTitleColor(UIColor(colorLiteralRed: 0/255, green: 153/255, blue: 255/255, alpha: 1), for: .normal)
                self.actionSheetOptionButton3.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 0.9)

            }
        })

    }

}
