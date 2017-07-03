//
//  GKTrafficHandler.swift
//  Poofy Blocks
//
//  Created by Bryan Mazariegos on 06/14/17.
//  Copyright © 2016 Bryan Mazariegos. All rights reserved.
//


import GameKit

class GKTrafficHandler:NSObject, GKGameCenterControllerDelegate {
    func authLocalPlayer() {
        let localPlayer = GKLocalPlayer.localPlayer()
        if localPlayer.isAuthenticated {
            
        }
        
        localPlayer.authenticateHandler = {(viewController:UIViewController?,error:Error?) -> Void in
                self.setLastError(error)
            
                if(viewController != nil) {
                    self.setAuthVC(viewController)
                } else if localPlayer.isAuthenticated {
                    _enableGameCenter = true
                    playerName = localPlayer.alias!
                    mVC.leadersBtn.isEnabled = true
                    
                    //Works without the following bit but have it just incase I need the default identifier later on
                    localPlayer.loadDefaultLeaderboardIdentifier(completionHandler: { (leaderboardIdentifier, error) in
                        if error != nil {
                            print("#DESTROYED BY SELF")
                        } else {
                            DEFAULT_LB = leaderboardIdentifier!
                        }
                    })
                } else {
                    _enableGameCenter = false
                }
        }
    }
    
    func submitHighScores() {
        let bestTimeInt = GKScore(leaderboardIdentifier: LB_ID_TIME)
        bestTimeInt.value = Int64(longestGame)
        GKScore.report([bestTimeInt]) { (error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                print("Best Time submitted to your Leaderboard!")
            }
        }
        
        let bestScoreInt = GKScore(leaderboardIdentifier: LB_ID_SCORE)
        bestScoreInt.value = Int64(highScore)
        GKScore.report([bestScoreInt]) { (error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                print("Best Score submitted to your Leaderboard!")
            }
        }
    }
    
    
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
    
    func setLastError(_ error:Error?) {
        
    }
    
    func setAuthVC(_ vc:UIViewController?) {
        if vc != nil {
            _authVC = vc
            print("Should Present AuthVC")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LoginMessage"), object: nil,userInfo: nil)
        } else {
            print("AuthVC nil")
        }
    }
    
    
}
