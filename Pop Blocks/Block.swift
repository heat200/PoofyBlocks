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
            let nBlock = Block(imageNamed: "Block_\(self.currentColor)")
            nBlock.size = self.size
            nBlock.currentColor = self.currentColor
            nBlock.position = self.position
            self.parent?.addChild(nBlock)
            
            self.run(self.popSound)
            
            let newAction = SKAction.group([SKAction.resize(toWidth: self.size.width * 2.5, height: self.size.height * 2.5, duration: 0.17),SKAction.fadeAlpha(to: 0, duration: 0.17)])
            nBlock.run(newAction, completion: {
                nBlock.removeFromParent()
            })
            
            self.lastColor = self.currentColor
            self.updateColor()
        })
    }
    
    func selectNewColor() {
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
            
            if randNum2 < 875 && randNum2 >= 700 {  //OG Values: 993 && 985
                type = "Bonus_Points"
            } else if randNum2 >= 875 {
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
