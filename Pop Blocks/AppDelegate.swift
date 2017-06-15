//
//  AppDelegate.swift
//  Pop Blocks
//
//  Created by Bryan Mazariegos on 6/1/17.
//  Copyright © 2017 Bryan Mazariegos. All rights reserved.
//

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
        
        if let blcksPopped = defaults.object(forKey: "blocksPopped") {
            blocksPopped = blcksPopped as! Int
        }
        
        if let last3 = defaults.object(forKey: "last3Games") {
            last3Games = last3 as! [Int]
        }
        
        if let sound = defaults.object(forKey: "soundOn") {
            soundOn = sound as! Bool
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
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

