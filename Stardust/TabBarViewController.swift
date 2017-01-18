//
//  TabBarViewController.swift
//  Stardust
//
//  Created by Randy Perecman on 1/17/17.
//  Copyright © 2017 Randy Perecman. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    // Outlets
    @IBOutlet weak var tabHighlight: UIView!
    @IBOutlet weak var tabContainer: UIView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Design
        tabContainer.layer.cornerRadius = tabContainer.frame.height / 2
        tabHighlight.layer.cornerRadius = tabHighlight.frame.height / 2
        tabHighlight.layer.zPosition = -5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tab1Pressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: UIViewAnimationOptions(), animations: {
        
            //self.leadingConstraint.constant = 0
            self.tabHighlight.center.x = self.tabHighlight.frame.width / 2

        })
    }

    @IBAction func tab2Pressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: UIViewAnimationOptions() ,animations: {
            // self.leadingConstraint.constant = (self.tabContainer.frame.width / 2) - (self.tabHighlight.frame.width / 2)
            self.tabHighlight.center.x = self.tabContainer.frame.width / 2

        })
    }

    @IBAction func tap3Pressed(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: UIViewAnimationOptions() ,animations: {
            //self.leadingConstraint.constant = (self.tabContainer.frame.width) - self.tabHighlight.frame.width
            self.tabHighlight.center.x = (self.tabContainer.frame.width) - self.tabHighlight.frame.width / 2

        })
    }
}
