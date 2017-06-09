//
//  Block.swift
//  Pop Blocks
//
//  Created by Bryan Mazariegos on 6/7/17.
//  Copyright © 2017 Bryan Mazariegos. All rights reserved.
//

import SpriteKit

class Block:SKSpriteNode {
    var currentColor = "Grey"
    var lastColor = ""
    var type = "Normal" //Normal, Bonus_Time
    var typeIndicator = SKSpriteNode(imageNamed: "Bonus_Time")
    var popSound = SKAction.playSoundFileNamed("popSound.m4a", waitForCompletion: false)
    
    func popAnimation(_ pos:Double) {
        self.run(SKAction.wait(forDuration: 0.08 * pos), completion: {
            let nBlock = SKSpriteNode(imageNamed: "Block_\(self.currentColor)")
            nBlock.size = self.size
            nBlock.position = self.position
            self.parent?.addChild(nBlock)
            
            if soundOn {
                self.run(self.popSound)
            }
            
            let newAction = SKAction.group([SKAction.resize(toWidth: self.size.width * 2.5, height: self.size.height * 2.5, duration: 0.17),SKAction.fadeAlpha(to: 0, duration: 0.17)])
            nBlock.run(newAction, completion: {
                nBlock.removeFromParent()
            })
            
            self.lastColor = self.currentColor
            self.updateColor()
        })
    }
    
    func blockID() -> Int {
        var id = 0
        if self.name == "block_1" {
            id = 1
        } else if self.name == "block_2" {
            id = 2
        } else if self.name == "block_3" {
            id = 3
        } else if self.name == "block_4" {
            id = 4
        } else if self.name == "block_5" {
            id = 5
        } else if self.name == "block_6" {
            id = 6
        } else if self.name == "block_7" {
            id = 7
        } else if self.name == "block_8" {
            id = 8
        } else if self.name == "block_9" {
            id = 9
        } else if self.name == "block_10" {
            id = 10
        } else if self.name == "block_11" {
            id = 11
        } else if self.name == "block_12" {
            id = 12
        } else if self.name == "block_13" {
            id = 13
        } else if self.name == "block_14" {
            id = 14
        } else if self.name == "block_15" {
            id = 15
        } else if self.name == "block_16" {
            id = 16
        } else if self.name == "block_17" {
            id = 17
        } else if self.name == "block_18" {
            id = 18
        } else if self.name == "block_19" {
            id = 19
        } else if self.name == "block_20" {
            id = 20
        } else if self.name == "block_21" {
            id = 21
        } else if self.name == "block_22" {
            id = 22
        } else if self.name == "block_23" {
            id = 23
        } else if self.name == "block_24" {
            id = 24
        } else if self.name == "block_25" {
            id = 25
        } else if self.name == "block_26" {
            id = 26
        } else if self.name == "block_27" {
            id = 27
        } else if self.name == "block_28" {
            id = 28
        } else if self.name == "block_29" {
            id = 29
        } else if self.name == "block_30" {
            id = 30
        } else if self.name == "block_31" {
            id = 31
        } else if self.name == "block_32" {
            id = 32
        } else if self.name == "block_33" {
            id = 33
        } else if self.name == "block_34" {
            id = 34
        } else if self.name == "block_35" {
            id = 35
        } else if self.name == "block_36" {
            id = 36
        } else {
            id = -1
        }
        
        return id
    }
    
    func selectNewColor() {
        self.color = .white
        if typeIndicator.parent == nil {
            typeIndicator.position = CGPoint(x: 0, y: 0)
            typeIndicator.size.width = self.size.width/4.0
            typeIndicator.size.height = self.size.height/4.0
            
            self.addChild(typeIndicator)
        }
        
        if currentColor == "Grey" || lastColor == currentColor {
            let randNum = Int(arc4random_uniform(1000) + 1)
            let randNum2 = Int(arc4random_uniform(1000) + 1)
            lastColor = currentColor
            
            if randNum <= 199 {
                currentColor = "Blue"
            } else if randNum <= 398 {
                currentColor = "Red"
            } else if randNum <= 597 {
                currentColor = "Yellow"
            } else if randNum <= 796 {
                currentColor = "Green"
            } else if randNum <= 995 {
                currentColor = "Purple"
            } else if randNum <= 1000 {
                currentColor = "Rainbow"
            }
            
            if randNum2 < 885 && randNum2 >= 700 {
                type = "Bonus_Points"
            } else if randNum2 >= 885 {
                type = "Bonus_Time"
            } else {
                type = "Normal"
            }
            
            updateColor()
        }
    }
    
    func updateColor() {
        self.run(SKAction.setTexture(SKTexture(imageNamed: "Block_\(currentColor)" )))
        
        if type == "Normal" {
            typeIndicator.isHidden = true
        } else {
            typeIndicator.isHidden = false
            typeIndicator.run(SKAction.setTexture(SKTexture(imageNamed: type)))
        }
    }
}
