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
    @IBOutlet var highscoreShuffleLabel:UILabel!
    @IBOutlet var highscoreSpinLabel:UILabel!
    @IBOutlet var highscoreFlipLabel:UILabel!
    @IBOutlet var highscoreFragileLabel:UILabel!
    @IBOutlet var totalTimeLabel:UILabel!
    @IBOutlet var blocksPoppedLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hoursPassed:Int = elapsedTime/3600
        let minutesPassed:Int = elapsedTime/60 - (hoursPassed * 60)
        let secondsPassed:Int = elapsedTime - (minutesPassed * 60) - (hoursPassed * 60 * 60)
        
        highscoreLabel.text = "Normal: \(highScore)pts"
        highscoreShuffleLabel.text = "Shuffle: \(highScore_Shuffle)pts"
        highscoreSpinLabel.text = "Spin: \(highScore_Spin)pts"
        highscoreFlipLabel.text = "Flip: \(highScore_Flip)pts"
        highscoreFragileLabel.text = "Fragile: \(highScore_Fragile)pts"
        totalTimeLabel.text = "Time Played: \(hoursPassed)h \(minutesPassed)m \(secondsPassed)s"
        blocksPoppedLabel.text = "Blocks Popped: \(blocksPopped)"
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
