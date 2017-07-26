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
        var bestTimeInt = GKScore(leaderboardIdentifier: LB_ID_TIME)
        bestTimeInt.value = Int64(longestGame)
        GKScore.report([bestTimeInt]) { (error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                print("Best Time submitted to your Leaderboard! (Normal)")
            }
        }
        
        var bestScoreInt = GKScore(leaderboardIdentifier: LB_ID_SCORE)
        bestScoreInt.value = Int64(highScore)
        GKScore.report([bestScoreInt]) { (error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                print("Best Score submitted to your Leaderboard! (Normal)")
            }
        }
        
        if ncPurchaseMade {
            bestTimeInt = GKScore(leaderboardIdentifier: LB_ID_TIME_SHUFFLE)
            bestTimeInt.value = Int64(longestGame_Shuffle)
            GKScore.report([bestTimeInt]) { (error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    print("Best Time submitted to your Leaderboard! (Shuffle)")
                }
            }
            
            bestScoreInt = GKScore(leaderboardIdentifier: LB_ID_SCORE_SHUFFLE)
            bestScoreInt.value = Int64(highScore_Shuffle)
            GKScore.report([bestScoreInt]) { (error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    print("Best Score submitted to your Leaderboard! (Shuffle)")
                }
            }
            
            bestTimeInt = GKScore(leaderboardIdentifier: LB_ID_TIME_SPIN)
            bestTimeInt.value = Int64(longestGame_Spin)
            GKScore.report([bestTimeInt]) { (error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    print("Best Time submitted to your Leaderboard! (Spin)")
                }
            }
            
            bestScoreInt = GKScore(leaderboardIdentifier: LB_ID_SCORE_SPIN)
            bestScoreInt.value = Int64(highScore_Spin)
            GKScore.report([bestScoreInt]) { (error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    print("Best Score submitted to your Leaderboard! (Spin)")
                }
            }
            
            bestTimeInt = GKScore(leaderboardIdentifier: LB_ID_TIME_FLIP)
            bestTimeInt.value = Int64(longestGame_Flip)
            GKScore.report([bestTimeInt]) { (error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    print("Best Time submitted to your Leaderboard! (Flip)")
                }
            }
            
            bestScoreInt = GKScore(leaderboardIdentifier: LB_ID_SCORE_FLIP)
            bestScoreInt.value = Int64(highScore_Flip)
            GKScore.report([bestScoreInt]) { (error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    print("Best Score submitted to your Leaderboard! (Flip)")
                }
            }
            
            bestTimeInt = GKScore(leaderboardIdentifier: LB_ID_TIME_FRAGILE)
            bestTimeInt.value = Int64(longestGame_Fragile)
            GKScore.report([bestTimeInt]) { (error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    print("Best Time submitted to your Leaderboard! (Fragile)")
                }
            }
            
            bestScoreInt = GKScore(leaderboardIdentifier: LB_ID_SCORE_FRAGILE)
            bestScoreInt.value = Int64(highScore_Fragile)
            GKScore.report([bestScoreInt]) { (error) in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    print("Best Score submitted to your Leaderboard! (Fragile)")
                }
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
