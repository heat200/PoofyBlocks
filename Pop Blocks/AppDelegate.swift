//
//  AppDelegate.swift
//  Pop Blocks
//
//  Created by Bryan Mazariegos on 6/1/17.
//  Copyright © 2017 Bryan Mazariegos. All rights reserved.
//

import GoogleMobileAds
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if let hiScore = defaults.object(forKey: "highScore") {
            highScore = hiScore as! Int
        }
        
        if let timeHiScore = defaults.object(forKey: "longestGame") {
            longestGame = timeHiScore as! Int
        }
        
        if let elapTime = defaults.object(forKey: "elapsedTime") {
            elapsedTime = elapTime as! Int
        }
        
        if let hiScore2 = defaults.object(forKey: "highScore_Shuffle") {
            highScore_Shuffle = hiScore2 as! Int
        }
        
        if let timeHiScore2 = defaults.object(forKey: "longestGame_Shuffle") {
            longestGame_Shuffle = timeHiScore2 as! Int
        }
        
        if let hiScore3 = defaults.object(forKey: "highScore_Spin") {
            highScore_Spin = hiScore3 as! Int
        }
        
        if let timeHiScore3 = defaults.object(forKey: "longestGame_Spin") {
            longestGame_Spin = timeHiScore3 as! Int
        }
        
        if let hiScore4 = defaults.object(forKey: "highScore_Flip") {
            highScore_Flip = hiScore4 as! Int
        }
        
        if let timeHiScore4 = defaults.object(forKey: "longestGame_Flip") {
            longestGame_Flip = timeHiScore4 as! Int
        }
        
        if let hiScore5 = defaults.object(forKey: "highScore_Fragile") {
            highScore_Fragile = hiScore5 as! Int
        }
        
        if let timeHiScore5 = defaults.object(forKey: "longestGame_Fragile") {
            longestGame_Fragile = timeHiScore5 as! Int
        }
        
        if let hiScore6 = defaults.object(forKey: "highScore_Hard") {
            highScore_Hard = hiScore6 as! Int
        }
        
        if let timeHiScore6 = defaults.object(forKey: "longestGame_Hard") {
            longestGame_Hard = timeHiScore6 as! Int
        }
        
        if let blcksPopped = defaults.object(forKey: "blocksPopped") {
            blocksPopped = blcksPopped as! Int
        }
        
        if let sound = defaults.object(forKey: "soundOn") {
            soundOn = sound as! Bool
        }
        
        GADMobileAds.configure(withApplicationID: "ca-app-pub-8229286366665385~1805690246")
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        shouldResetBlockPlacement = true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

