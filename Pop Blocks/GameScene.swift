//
//  GameScene.swift
//  Pop Blocks
//
//  Created by Bryan Mazariegos on 6/1/17.
//  Copyright © 2017 Bryan Mazariegos. All rights reserved.
//

import SpriteKit
import GameplayKit

var highScore = 0

class GameScene: SKScene {
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    var debugging = true
    
    private var lastUpdateTime : TimeInterval = 0
    var blockArray = [Block]()
    let DEFAULT_GAMETIME = 60
    var gameTime = 10
    var gameScore = 0
    var timeLabel:SKLabelNode!
    var scoreLabel:SKLabelNode!
    var highScoreLabel:SKLabelNode!
    var timeOverLabel:SKLabelNode!
    var lastSecondCounted:TimeInterval = 0
    var block_1:Block!
    var block_2:Block!
    var block_3:Block!
    var block_4:Block!
    var block_5:Block!
    var block_6:Block!
    var block_7:Block!
    var block_8:Block!
    var block_9:Block!
    var block_10:Block!
    var block_11:Block!
    var block_12:Block!
    var block_13:Block!
    var block_14:Block!
    var block_15:Block!
    var block_16:Block!
    var block_17:Block!
    var block_18:Block!
    var block_19:Block!
    var block_20:Block!
    var block_21:Block!
    var block_22:Block!
    var block_23:Block!
    var block_24:Block!
    var block_25:Block!
    var block_26:Block!
    var block_27:Block!
    var block_28:Block!
    var block_29:Block!
    var block_30:Block!
    var block_31:Block!
    var block_32:Block!
    var block_33:Block!
    var block_34:Block!
    var block_35:Block!
    var block_36:Block!
    
    override func sceneDidLoad() {
        self.lastUpdateTime = 0
        gameTime = DEFAULT_GAMETIME
        timeLabel = self.childNode(withName: "timeLabel") as! SKLabelNode
        timeOverLabel = self.childNode(withName: "timeOverLabel") as! SKLabelNode
        highScoreLabel = self.childNode(withName: "highScoreLabel") as! SKLabelNode
        scoreLabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
        block_1 = self.childNode(withName: "block_1") as! Block
        block_2 = self.childNode(withName: "block_2") as! Block
        block_3 = self.childNode(withName: "block_3") as! Block
        block_4 = self.childNode(withName: "block_4") as! Block
        block_5 = self.childNode(withName: "block_5") as! Block
        block_6 = self.childNode(withName: "block_6") as! Block
        block_7 = self.childNode(withName: "block_7") as! Block
        block_8 = self.childNode(withName: "block_8") as! Block
        block_9 = self.childNode(withName: "block_9") as! Block
        block_10 = self.childNode(withName: "block_10") as! Block
        block_11 = self.childNode(withName: "block_11") as! Block
        block_12 = self.childNode(withName: "block_12") as! Block
        block_13 = self.childNode(withName: "block_13") as! Block
        block_14 = self.childNode(withName: "block_14") as! Block
        block_15 = self.childNode(withName: "block_15") as! Block
        block_16 = self.childNode(withName: "block_16") as! Block
        block_17 = self.childNode(withName: "block_17") as! Block
        block_18 = self.childNode(withName: "block_18") as! Block
        block_19 = self.childNode(withName: "block_19") as! Block
        block_20 = self.childNode(withName: "block_20") as! Block
        block_21 = self.childNode(withName: "block_21") as! Block
        block_22 = self.childNode(withName: "block_22") as! Block
        block_23 = self.childNode(withName: "block_23") as! Block
        block_24 = self.childNode(withName: "block_24") as! Block
        block_25 = self.childNode(withName: "block_25") as! Block
        block_26 = self.childNode(withName: "block_26") as! Block
        block_27 = self.childNode(withName: "block_27") as! Block
        block_28 = self.childNode(withName: "block_28") as! Block
        block_29 = self.childNode(withName: "block_29") as! Block
        block_30 = self.childNode(withName: "block_30") as! Block
        block_31 = self.childNode(withName: "block_31") as! Block
        block_32 = self.childNode(withName: "block_32") as! Block
        block_33 = self.childNode(withName: "block_33") as! Block
        block_34 = self.childNode(withName: "block_34") as! Block
        block_35 = self.childNode(withName: "block_35") as! Block
        block_36 = self.childNode(withName: "block_36") as! Block
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if timeOverLabel.isHidden {
            blockArray.removeAll()
            let node = self.atPoint(pos)
            if node is Block {
                let block = node as! Block
                if !blockArray.contains(block) {
                    blockArray.append(block)
                }
            } else if node.parent is Block {
                let block = node.parent as! Block
                if !blockArray.contains(block) {
                    blockArray.append(block)
                }
            }
        } else {
            restartGame()
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if timeOverLabel.isHidden {
            let node = self.atPoint(pos)
            if node is Block {
                let block = node as! Block
                if !blockArray.contains(block) {
                    blockArray.append(block)
                }
            } else if node.parent is Block {
                let block = node.parent as! Block
                if !blockArray.contains(block) {
                    blockArray.append(block)
                }
            } else {
               self.checkSwipedBlocks()
            }
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if timeOverLabel.isHidden {
            let node = self.atPoint(pos)
            if node is Block {
                let block = node as! Block
                if !blockArray.contains(block) {
                    blockArray.append(block)
                }
                self.checkSwipedBlocks()
            } else if node.parent is Block {
                let block = node.parent as! Block
                if !blockArray.contains(block) {
                    blockArray.append(block)
                }
                self.checkSwipedBlocks()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    func pickColorToCheckFor(_ pos:Int) -> String {
        var colorToCheckFor = blockArray[pos].currentColor
        
        if colorToCheckFor == "Rainbow" {
            colorToCheckFor = pickColorToCheckFor(pos + 1)
        }
        
        return colorToCheckFor
    }
    
    func checkSwipedBlocks() {
        if blockArray.count > 2 {
            var x = 0
            var colorToCheckFor = pickColorToCheckFor(0)
            
            var blocksAreGood = true
            
            while x < blockArray.count {
                if blockArray[x].currentColor != colorToCheckFor {
                    if blockArray[x].currentColor != "Rainbow" {
                        blocksAreGood = false
                    }
                }
                x += 1
            }
            
            if blocksAreGood && blockArray.count >= 3 {
                gameScore += blockArray.count * (blockArray.count - 2) //Ranges from 3-1224
                
                x = 0
                while x < blockArray.count {
                    blockArray[x].popAnimation()
                    x += 1
                }
                blockArray.removeAll()
            }
        }
    }
    
    func timeOver() {
        timeOverLabel.isHidden = false
    }
    
    func restartGame() {
        timeOverLabel.isHidden = true
        gameTime = DEFAULT_GAMETIME
        gameScore = 0
        block_1.currentColor = "Grey"
        block_2.currentColor = "Grey"
        block_3.currentColor = "Grey"
        block_4.currentColor = "Grey"
        block_5.currentColor = "Grey"
        block_6.currentColor = "Grey"
        block_7.currentColor = "Grey"
        block_8.currentColor = "Grey"
        block_9.currentColor = "Grey"
        block_10.currentColor = "Grey"
        block_11.currentColor = "Grey"
        block_12.currentColor = "Grey"
        block_13.currentColor = "Grey"
        block_14.currentColor = "Grey"
        block_15.currentColor = "Grey"
        block_16.currentColor = "Grey"
        block_17.currentColor = "Grey"
        block_18.currentColor = "Grey"
        block_19.currentColor = "Grey"
        block_20.currentColor = "Grey"
        block_21.currentColor = "Grey"
        block_22.currentColor = "Grey"
        block_23.currentColor = "Grey"
        block_24.currentColor = "Grey"
        block_25.currentColor = "Grey"
        block_26.currentColor = "Grey"
        block_27.currentColor = "Grey"
        block_28.currentColor = "Grey"
        block_29.currentColor = "Grey"
        block_30.currentColor = "Grey"
        block_31.currentColor = "Grey"
        block_32.currentColor = "Grey"
        block_33.currentColor = "Grey"
        block_34.currentColor = "Grey"
        block_35.currentColor = "Grey"
        block_36.currentColor = "Grey"
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        if currentTime - lastSecondCounted >= 1 {
            lastSecondCounted = currentTime
            gameTime -= 1
            if gameTime <= 0 {
                gameTime = 0
                timeOver()
            }
        }
        
        timeLabel.text = "\(gameTime)s"
        scoreLabel.text = "\(gameScore) pts"
        highScoreLabel.text = "Highscore: \(highScore) pts"
        
        if gameScore > highScore {
            highScore = gameScore
        }
        
        if timeOverLabel.isHidden {
            block_1.selectNewColor()
            block_2.selectNewColor()
            block_3.selectNewColor()
            block_4.selectNewColor()
            block_5.selectNewColor()
            block_6.selectNewColor()
            block_7.selectNewColor()
            block_8.selectNewColor()
            block_9.selectNewColor()
            block_10.selectNewColor()
            block_11.selectNewColor()
            block_12.selectNewColor()
            block_13.selectNewColor()
            block_14.selectNewColor()
            block_15.selectNewColor()
            block_16.selectNewColor()
            block_17.selectNewColor()
            block_18.selectNewColor()
            block_19.selectNewColor()
            block_20.selectNewColor()
            block_21.selectNewColor()
            block_22.selectNewColor()
            block_23.selectNewColor()
            block_24.selectNewColor()
            block_25.selectNewColor()
            block_26.selectNewColor()
            block_27.selectNewColor()
            block_28.selectNewColor()
            block_29.selectNewColor()
            block_30.selectNewColor()
            block_31.selectNewColor()
            block_32.selectNewColor()
            block_33.selectNewColor()
            block_34.selectNewColor()
            block_35.selectNewColor()
            block_36.selectNewColor()
        }
        
        let dt = currentTime - self.lastUpdateTime
        
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
    
    func showPauseMenu() {
        
    }
}
