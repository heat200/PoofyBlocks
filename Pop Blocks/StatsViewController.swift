//
//  StatsViewController.swift
//  Pop Blocks
//
//  Created by Bryan Mazariegos on 6/7/17.
//  Copyright © 2017 Bryan Mazariegos. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    @IBOutlet var highscoreLabel:UILabel!
    @IBOutlet var totalTimeLabel:UILabel!
    @IBOutlet var blocksPoppedLabel:UILabel!
    @IBOutlet var averageScoreLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hoursPassed:Int = elapsedTime/3600
        let minutesPassed:Int = elapsedTime/60 - (hoursPassed * 60)
        let secondsPassed:Int = elapsedTime - (minutesPassed * 60) - (hoursPassed * 60 * 60)
        
        highscoreLabel.text = "Highscore: \(highScore)pts"
        totalTimeLabel.text = "Time Played: \(hoursPassed)h \(minutesPassed)m \(secondsPassed)s"
        blocksPoppedLabel.text = "Blocks Popped: \(blocksPopped)"
        if last3Games.count == 3 {
            let avg:Int = Int(CGFloat(last3Games[0] + last3Games[1] + last3Games[2])/3.0)
            averageScoreLabel.text = "3 Game Avg: \(avg)pts"
        } else {
            print("You have only played \(last3Games.count) games.")
            averageScoreLabel.text = "3 Game Avg: N/A"
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
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func returnToMenu() {
        self.dismiss(animated: true, completion: {})
    }
}
