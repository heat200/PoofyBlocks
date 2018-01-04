//
//  GameViewController.swift
//  Pop Blocks
//
//  Created by Bryan Mazariegos on 6/6/17.
//  Copyright © 2017 Bryan Mazariegos. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import GoogleMobileAds

class GameViewController: UIViewController, GADBannerViewDelegate, GADRewardBasedVideoAdDelegate {
    let bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        bannerView.delegate = self
        bannerView.adUnitID = "ca-app-pub-8229286366665385/8700187147"
        bannerView.rootViewController = self
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID, "d20f5aacd954f82d48e2b613e9defcb3"]
        bannerView.load(request)
        bannerView.frame.origin.x = 0
        bannerView.frame.origin.y = self.view.frame.maxY - bannerView.frame.height
        if let scene = GameScene(fileNamed: "GameScene") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit
            var size = scene.size
            
            // Present the scene
            if let view = self.view as! SKView? {
                scene.vc = self
                let newWidth = view.bounds.size.width / view.bounds.height * size.height
                if newWidth > size.width {
                    size.width = newWidth
                    scene.size = size
                }
                view.presentScene(scene)
                
                view.ignoresSiblingOrder = false
                
                view.showsFPS = false
                view.showsNodeCount = false
            }
        }
        
        UIView.animate(withDuration: 0.75) {
            self.view.layoutIfNeeded()
            self.view.addSubview(self.bannerView)
        }
    }
    
    func LoginMessage() {
        if _authVC != nil {
            self.present(_authVC!, animated: false, completion: {})
        }
    }
    
    func reviveWithAd() {
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID, "d20f5aacd954f82d48e2b613e9defcb3"]
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        GADRewardBasedVideoAd.sharedInstance().load(request,withAdUnitID: "ca-app-pub-8229286366665385/3276470077")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        print(reward.amount)
        gc.reviveGame(withTime: Int(reward.amount))
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd:GADRewardBasedVideoAd) {
        print("Reward based video ad is received.")
        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        }
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Opened reward based video ad.")
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad started playing.")
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad is closed.")
        gc.reviveAdLabel.text = "Ad was closed"
        gc.reviveButton.isHidden = true
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad will leave application.")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        print("Reward based video ad failed to load.")
        gc.reviveAdLabel.text = "Failed to load"
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
    
    func returnToMenu() {
        self.dismiss(animated: true, completion: {})
    }
}
