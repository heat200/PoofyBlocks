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

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        if let scene = GameScene(fileNamed: "GameScene") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFit
            var size = scene.size
            
            // Present the scene
            if let view = self.view as! SKView? {
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
    }
    
    func LoginMessage() {
        if _authVC != nil {
            self.present(_authVC!, animated: false, completion: {})
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
    
    func returnToMenu() {
        self.dismiss(animated: true, completion: {})
    }
}
