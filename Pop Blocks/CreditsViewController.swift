//
//  CreditsViewController.swift
//  Pop Blocks
//
//  Created by Bryan Mazariegos on 6/7/17.
//  Copyright © 2017 Bryan Mazariegos. All rights reserved.
//

import UIKit

class CreditsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func returnToMenu() {
        self.dismiss(animated: true, completion: {})
        if soundOn {
            player.play()
        }
    }
}
