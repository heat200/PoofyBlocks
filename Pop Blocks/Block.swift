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
    var popSound = SKAction.playSoundFileNamed("popSound2.m4a", waitForCompletion: false)
    var acceptedBlocks = [Block]()
    var trueNeighbors = [Block]()
    
    func popAnimation(_ pos:Double) {
        self.run(SKAction.wait(forDuration: 0.07 * pos), completion: {
            let nBlock = SKSpriteNode(imageNamed: "Block_\(self.currentColor)")
            nBlock.size = self.size
            nBlock.position = self.position
            nBlock.alpha = 0.9
            self.parent?.addChild(nBlock)
            
            if soundOn {
                self.run(self.popSound)
            }
            
            let newAction = SKAction.group([SKAction.resize(toWidth: self.size.width * 2.5, height: self.size.height * 2.5, duration: 0.7),SKAction.fadeAlpha(to: 0, duration: 0.7)])
            nBlock.run(newAction, completion: {
                nBlock.removeFromParent()
            })
            
            self.lastColor = self.currentColor
            self.updateColor()
        })
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
            let avgChance = 198
            let redChanceMod = (self.returnRedNeighbors() * 6)
            let blueChanceMod = (self.returnBlueNeighbors() * 6)
            let yellowChanceMod = (self.returnYellowNeighbors() * 6)
            let greenChanceMod = (self.returnGreenNeighbors() * 6)
            let purpleChanceMod = (self.returnPurpleNeighbors() * 6)
            
            if randNum <= (avgChance + blueChanceMod) {
                currentColor = "Blue"
            } else if randNum <= (avgChance + redChanceMod) * 2 {
                currentColor = "Red"
            } else if randNum <= (avgChance + yellowChanceMod) * 3 {
                currentColor = "Yellow"
            } else if randNum <= (avgChance + greenChanceMod) * 4 {
                currentColor = "Green"
            } else if randNum <= (avgChance + purpleChanceMod) * 5 {
                currentColor = "Purple"
            } else if randNum <= 1000 {
                currentColor = "Rainbow"
            }
            
            var bonusChanceMod = 0
            if currentColor == "Blue" {
                bonusChanceMod = (self.returnBlueNeighbors() * self.returnBlueNeighbors() * 2) - 15
            } else if currentColor == "Red" {
                bonusChanceMod = (self.returnRedNeighbors() * self.returnRedNeighbors() * 2) - 15
            } else if currentColor == "Yellow" {
                bonusChanceMod = (self.returnYellowNeighbors() * self.returnYellowNeighbors() * 2) - 15
            } else if currentColor == "Green" {
                bonusChanceMod = (self.returnGreenNeighbors() * self.returnGreenNeighbors() * 2) - 15
            } else if currentColor == "Purple" {
                bonusChanceMod = (self.returnPurpleNeighbors() * self.returnPurpleNeighbors() * 2) - 15
            }
            
            if randNum2 < 900 && randNum2 >= (875 - bonusChanceMod) {
                type = "Bonus_Points"
            } else if randNum2 >= 900 {
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
        
        if currentColor == "Grey" {
            let parent = self.parent as! GameScene
            parent.uncolorize(self)
        }
    }
    
    func setUpAcceptedBlocks() {
        let id = self.blockID()
        let parent = self.parent as! GameScene
        
        switch id {
        case 1:
            acceptedBlocks.append(parent.block_8)
            trueNeighbors.append(parent.block_2)
            trueNeighbors.append(parent.block_7)
            break
        case 2:
            acceptedBlocks.append(parent.block_7)
            acceptedBlocks.append(parent.block_9)
            trueNeighbors.append(parent.block_2)
            trueNeighbors.append(parent.block_9)
            trueNeighbors.append(parent.block_4)
            break
        case 3:
            acceptedBlocks.append(parent.block_8)
            acceptedBlocks.append(parent.block_10)
            trueNeighbors.append(parent.block_1)
            trueNeighbors.append(parent.block_3)
            trueNeighbors.append(parent.block_8)
            break
        case 4:
            acceptedBlocks.append(parent.block_9)
            acceptedBlocks.append(parent.block_11)
            trueNeighbors.append(parent.block_3)
            trueNeighbors.append(parent.block_5)
            trueNeighbors.append(parent.block_10)
            break
        case 5:
            acceptedBlocks.append(parent.block_10)
            acceptedBlocks.append(parent.block_12)
            trueNeighbors.append(parent.block_4)
            trueNeighbors.append(parent.block_6)
            trueNeighbors.append(parent.block_11)
            break
        case 6:
            acceptedBlocks.append(parent.block_11)
            trueNeighbors.append(parent.block_5)
            trueNeighbors.append(parent.block_12)
            break
        case 7:
            acceptedBlocks.append(parent.block_2)
            acceptedBlocks.append(parent.block_14)
            trueNeighbors.append(parent.block_1)
            trueNeighbors.append(parent.block_8)
            trueNeighbors.append(parent.block_13)
            break
        case 8:
            acceptedBlocks.append(parent.block_1)
            acceptedBlocks.append(parent.block_3)
            acceptedBlocks.append(parent.block_13)
            acceptedBlocks.append(parent.block_15)
            trueNeighbors.append(parent.block_2)
            trueNeighbors.append(parent.block_7)
            trueNeighbors.append(parent.block_9)
            trueNeighbors.append(parent.block_14)
            break
        case 9:
            acceptedBlocks.append(parent.block_2)
            acceptedBlocks.append(parent.block_4)
            acceptedBlocks.append(parent.block_14)
            acceptedBlocks.append(parent.block_16)
            trueNeighbors.append(parent.block_3)
            trueNeighbors.append(parent.block_8)
            trueNeighbors.append(parent.block_10)
            trueNeighbors.append(parent.block_15)
            break
        case 10:
            acceptedBlocks.append(parent.block_3)
            acceptedBlocks.append(parent.block_5)
            acceptedBlocks.append(parent.block_15)
            acceptedBlocks.append(parent.block_17)
            trueNeighbors.append(parent.block_4)
            trueNeighbors.append(parent.block_9)
            trueNeighbors.append(parent.block_11)
            trueNeighbors.append(parent.block_16)
            break
        case 11:
            acceptedBlocks.append(parent.block_4)
            acceptedBlocks.append(parent.block_6)
            acceptedBlocks.append(parent.block_16)
            acceptedBlocks.append(parent.block_18)
            trueNeighbors.append(parent.block_5)
            trueNeighbors.append(parent.block_10)
            trueNeighbors.append(parent.block_12)
            trueNeighbors.append(parent.block_17)
            break
        case 12:
            acceptedBlocks.append(parent.block_5)
            acceptedBlocks.append(parent.block_17)
            trueNeighbors.append(parent.block_6)
            trueNeighbors.append(parent.block_11)
            trueNeighbors.append(parent.block_18)
            break
        case 13:
            acceptedBlocks.append(parent.block_8)
            acceptedBlocks.append(parent.block_20)
            trueNeighbors.append(parent.block_7)
            trueNeighbors.append(parent.block_14)
            trueNeighbors.append(parent.block_19)
            break
        case 14:
            acceptedBlocks.append(parent.block_7)
            acceptedBlocks.append(parent.block_9)
            acceptedBlocks.append(parent.block_19)
            acceptedBlocks.append(parent.block_21)
            trueNeighbors.append(parent.block_8)
            trueNeighbors.append(parent.block_13)
            trueNeighbors.append(parent.block_15)
            trueNeighbors.append(parent.block_20)
            break
        case 15:
            acceptedBlocks.append(parent.block_8)
            acceptedBlocks.append(parent.block_10)
            acceptedBlocks.append(parent.block_20)
            acceptedBlocks.append(parent.block_22)
            trueNeighbors.append(parent.block_9)
            trueNeighbors.append(parent.block_14)
            trueNeighbors.append(parent.block_16)
            trueNeighbors.append(parent.block_21)
            break
        case 16:
            acceptedBlocks.append(parent.block_9)
            acceptedBlocks.append(parent.block_11)
            acceptedBlocks.append(parent.block_21)
            acceptedBlocks.append(parent.block_23)
            trueNeighbors.append(parent.block_10)
            trueNeighbors.append(parent.block_15)
            trueNeighbors.append(parent.block_17)
            trueNeighbors.append(parent.block_22)
            break
        case 17:
            acceptedBlocks.append(parent.block_10)
            acceptedBlocks.append(parent.block_12)
            acceptedBlocks.append(parent.block_22)
            acceptedBlocks.append(parent.block_24)
            trueNeighbors.append(parent.block_11)
            trueNeighbors.append(parent.block_16)
            trueNeighbors.append(parent.block_18)
            trueNeighbors.append(parent.block_23)
            break
        case 18:
            acceptedBlocks.append(parent.block_11)
            acceptedBlocks.append(parent.block_23)
            trueNeighbors.append(parent.block_12)
            trueNeighbors.append(parent.block_17)
            trueNeighbors.append(parent.block_24)
            break
        case 19:
            acceptedBlocks.append(parent.block_14)
            acceptedBlocks.append(parent.block_26)
            trueNeighbors.append(parent.block_13)
            trueNeighbors.append(parent.block_20)
            trueNeighbors.append(parent.block_25)
            break
        case 20:
            acceptedBlocks.append(parent.block_13)
            acceptedBlocks.append(parent.block_15)
            acceptedBlocks.append(parent.block_25)
            acceptedBlocks.append(parent.block_27)
            trueNeighbors.append(parent.block_14)
            trueNeighbors.append(parent.block_19)
            trueNeighbors.append(parent.block_21)
            trueNeighbors.append(parent.block_26)
            break
        case 21:
            acceptedBlocks.append(parent.block_14)
            acceptedBlocks.append(parent.block_16)
            acceptedBlocks.append(parent.block_26)
            acceptedBlocks.append(parent.block_28)
            trueNeighbors.append(parent.block_15)
            trueNeighbors.append(parent.block_20)
            trueNeighbors.append(parent.block_22)
            trueNeighbors.append(parent.block_27)
            break
        case 22:
            acceptedBlocks.append(parent.block_15)
            acceptedBlocks.append(parent.block_17)
            acceptedBlocks.append(parent.block_27)
            acceptedBlocks.append(parent.block_29)
            trueNeighbors.append(parent.block_16)
            trueNeighbors.append(parent.block_21)
            trueNeighbors.append(parent.block_23)
            trueNeighbors.append(parent.block_28)
            break
        case 23:
            acceptedBlocks.append(parent.block_16)
            acceptedBlocks.append(parent.block_18)
            acceptedBlocks.append(parent.block_28)
            acceptedBlocks.append(parent.block_30)
            trueNeighbors.append(parent.block_17)
            trueNeighbors.append(parent.block_22)
            trueNeighbors.append(parent.block_24)
            trueNeighbors.append(parent.block_29)
            break
        case 24:
            acceptedBlocks.append(parent.block_17)
            acceptedBlocks.append(parent.block_29)
            trueNeighbors.append(parent.block_18)
            trueNeighbors.append(parent.block_23)
            trueNeighbors.append(parent.block_30)
            break
        case 25:
            acceptedBlocks.append(parent.block_20)
            acceptedBlocks.append(parent.block_32)
            trueNeighbors.append(parent.block_19)
            trueNeighbors.append(parent.block_26)
            trueNeighbors.append(parent.block_31)
            break
        case 26:
            acceptedBlocks.append(parent.block_19)
            acceptedBlocks.append(parent.block_21)
            acceptedBlocks.append(parent.block_31)
            acceptedBlocks.append(parent.block_33)
            trueNeighbors.append(parent.block_20)
            trueNeighbors.append(parent.block_25)
            trueNeighbors.append(parent.block_27)
            trueNeighbors.append(parent.block_32)
            break
        case 27:
            acceptedBlocks.append(parent.block_20)
            acceptedBlocks.append(parent.block_22)
            acceptedBlocks.append(parent.block_32)
            acceptedBlocks.append(parent.block_34)
            trueNeighbors.append(parent.block_21)
            trueNeighbors.append(parent.block_26)
            trueNeighbors.append(parent.block_28)
            trueNeighbors.append(parent.block_33)
            break
        case 28:
            acceptedBlocks.append(parent.block_21)
            acceptedBlocks.append(parent.block_23)
            acceptedBlocks.append(parent.block_33)
            acceptedBlocks.append(parent.block_35)
            trueNeighbors.append(parent.block_22)
            trueNeighbors.append(parent.block_27)
            trueNeighbors.append(parent.block_29)
            trueNeighbors.append(parent.block_34)
            break
        case 29:
            acceptedBlocks.append(parent.block_22)
            acceptedBlocks.append(parent.block_24)
            acceptedBlocks.append(parent.block_34)
            acceptedBlocks.append(parent.block_36)
            trueNeighbors.append(parent.block_23)
            trueNeighbors.append(parent.block_28)
            trueNeighbors.append(parent.block_30)
            trueNeighbors.append(parent.block_35)
            break
        case 30:
            acceptedBlocks.append(parent.block_23)
            acceptedBlocks.append(parent.block_35)
            trueNeighbors.append(parent.block_24)
            trueNeighbors.append(parent.block_29)
            trueNeighbors.append(parent.block_36)
            break
        case 31:
            acceptedBlocks.append(parent.block_26)
            trueNeighbors.append(parent.block_25)
            trueNeighbors.append(parent.block_32)
            break
        case 32:
            acceptedBlocks.append(parent.block_25)
            acceptedBlocks.append(parent.block_27)
            trueNeighbors.append(parent.block_31)
            trueNeighbors.append(parent.block_26)
            trueNeighbors.append(parent.block_33)
            break
        case 33:
            acceptedBlocks.append(parent.block_26)
            acceptedBlocks.append(parent.block_28)
            trueNeighbors.append(parent.block_32)
            trueNeighbors.append(parent.block_27)
            trueNeighbors.append(parent.block_34)
            break
        case 34:
            acceptedBlocks.append(parent.block_27)
            acceptedBlocks.append(parent.block_29)
            trueNeighbors.append(parent.block_33)
            trueNeighbors.append(parent.block_28)
            trueNeighbors.append(parent.block_35)
            break
        case 35:
            acceptedBlocks.append(parent.block_28)
            acceptedBlocks.append(parent.block_30)
            trueNeighbors.append(parent.block_29)
            trueNeighbors.append(parent.block_34)
            trueNeighbors.append(parent.block_36)
            break
        case 36:
            acceptedBlocks.append(parent.block_29)
            trueNeighbors.append(parent.block_30)
            trueNeighbors.append(parent.block_35)
            break
            
        default:
            print("DERP")
            break
        }
        
        trueNeighbors.append(contentsOf: acceptedBlocks)
        
        if id == 1 || id == 2 || id == 3 || id == 4 || id == 5 || id == 6 || id == 12 || id == 18 || id == 24 || id == 30 || id == 36 || id == 35 || id == 34 || id == 33 || id == 32 || id == 31 || id == 25 || id == 19 || id == 13 || id == 7 {
            if !acceptedBlocks.contains(parent.block_1) {
                acceptedBlocks.append(parent.block_1)
            }
            
            if !acceptedBlocks.contains(parent.block_2) {
                acceptedBlocks.append(parent.block_2)
            }
            
            if !acceptedBlocks.contains(parent.block_3) {
                acceptedBlocks.append(parent.block_3)
            }
            
            if !acceptedBlocks.contains(parent.block_4) {
                acceptedBlocks.append(parent.block_4)
            }
            
            if !acceptedBlocks.contains(parent.block_5) {
                acceptedBlocks.append(parent.block_5)
            }
            
            if !acceptedBlocks.contains(parent.block_6) {
                acceptedBlocks.append(parent.block_6)
            }
            
            if !acceptedBlocks.contains(parent.block_12) {
                acceptedBlocks.append(parent.block_12)
            }
            
            if !acceptedBlocks.contains(parent.block_18) {
                acceptedBlocks.append(parent.block_18)
            }
            
            if !acceptedBlocks.contains(parent.block_24) {
                acceptedBlocks.append(parent.block_24)
            }
            
            if !acceptedBlocks.contains(parent.block_30) {
                acceptedBlocks.append(parent.block_30)
            }
            
            if !acceptedBlocks.contains(parent.block_36) {
                acceptedBlocks.append(parent.block_36)
            }
            
            if !acceptedBlocks.contains(parent.block_35) {
                acceptedBlocks.append(parent.block_35)
            }
            
            if !acceptedBlocks.contains(parent.block_34) {
                acceptedBlocks.append(parent.block_34)
            }
            
            if !acceptedBlocks.contains(parent.block_33) {
                acceptedBlocks.append(parent.block_33)
            }
            
            if !acceptedBlocks.contains(parent.block_32) {
                acceptedBlocks.append(parent.block_32)
            }
            
            if !acceptedBlocks.contains(parent.block_31) {
                acceptedBlocks.append(parent.block_31)
            }
            
            if !acceptedBlocks.contains(parent.block_25) {
                acceptedBlocks.append(parent.block_25)
            }
            
            if !acceptedBlocks.contains(parent.block_19) {
                acceptedBlocks.append(parent.block_19)
            }
            
            if !acceptedBlocks.contains(parent.block_13) {
                acceptedBlocks.append(parent.block_13)
            }
            
            if !acceptedBlocks.contains(parent.block_7) {
                acceptedBlocks.append(parent.block_7)
            }
        }
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
    
    func returnBlueNeighbors() -> Int {
        var count = 0
        var x = 0
        while x < trueNeighbors.count {
            if trueNeighbors[x].currentColor == "Blue" {
                count += 1
            }
            x += 1
        }
        
        return count
    }
    
    func returnRedNeighbors() -> Int {
        var count = 0
        var x = 0
        while x < trueNeighbors.count {
            if trueNeighbors[x].currentColor == "Red" {
                count += 1
            }
            x += 1
        }
        
        return count
    }
    
    func returnYellowNeighbors() -> Int {
        var count = 0
        var x = 0
        while x < trueNeighbors.count {
            if trueNeighbors[x].currentColor == "Yellow" {
                count += 1
            }
            x += 1
        }
        
        return count
    }
    
    func returnGreenNeighbors() -> Int {
        var count = 0
        var x = 0
        while x < trueNeighbors.count {
            if trueNeighbors[x].currentColor == "Green" {
                count += 1
            }
            x += 1
        }
        
        return count
    }
    
    func returnPurpleNeighbors() -> Int {
        var count = 0
        var x = 0
        while x < trueNeighbors.count {
            if trueNeighbors[x].currentColor == "Purple" {
                count += 1
            }
            x += 1
        }
        
        return count
    }
}
