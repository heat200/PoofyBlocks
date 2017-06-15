//
//  MainViewController.swift
//  Pop Blocks
//
//  Created by Bryan Mazariegos on 6/1/17.
//  Copyright © 2017 Bryan Mazariegos. All rights reserved.
//

import UIKit
import GameKit

let defaults = UserDefaults.standard
var _enableGameCenter = true
var _authVC:UIViewController?
var attemptedAuth = false
var appDelegate:AppDelegate!
var GK_TRAFFIC_HANDLER:GKTrafficHandler!
var playerName = ""
var DEFAULT_LB = ""
var LB_ID_SCORE = "PoofyBlocks_Highest_Score"
var LB_ID_TIME = "PoofyBlocks_Longest_Time"

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if GK_TRAFFIC_HANDLER == nil {
            GK_TRAFFIC_HANDLER = GKTrafficHandler()
        }
        
        if !attemptedAuth {
            attemptedAuth = true
            GK_TRAFFIC_HANDLER.authLocalPlayer()
        }
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
    
    @IBAction func openLB() {
        GK_TRAFFIC_HANDLER.submitHighScores()
        
        let gcVC = GKGameCenterViewController()
        gcVC.gameCenterDelegate = GK_TRAFFIC_HANDLER
        gcVC.viewState = .leaderboards
        gcVC.leaderboardIdentifier = LB_ID_SCORE
        self.present(gcVC, animated: true, completion: nil)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
