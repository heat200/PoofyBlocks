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
var elapsedTime = 0
var soundOn = true
var last3Games = [Int]()
var blocksPopped = 0

class GameScene: SKScene {
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    var timeSound_B = SKAction.playSoundFileNamed("timeSound_B.m4a", waitForCompletion: false)
    var timeSound = SKAction.playSoundFileNamed("timeSound.m4a", waitForCompletion: false)
    var timeSound_Y = SKAction.playSoundFileNamed("timeSound_Y.m4a", waitForCompletion: false)
    var timeSound_O = SKAction.playSoundFileNamed("timeSound_O.m4a", waitForCompletion: false)
    var timeSound_R = SKAction.playSoundFileNamed("timeSound_R.m4a", waitForCompletion: false)
    var blockArray = [Block]()
    var freeSecondPassed = false
    let DEFAULT_GAMETIME = 61
    var gameTime = 10
    var gameScore = 0
    var gamePlayTime = 0
    var timeLabel:SKLabelNode!
    var totalTimeLabel:SKLabelNode!
    var scoreLabel:SKLabelNode!
    var highScoreLabel:SKLabelNode!
    var timeOverLabel:SKLabelNode!
    var pauseOverlay:SKSpriteNode!
    var pauseButton:SKSpriteNode!
    var continueButton:SKSpriteNode!
    var restartButton:SKSpriteNode!
    var menuButton:SKSpriteNode!
    var volumeButton:SKSpriteNode!
    var lastSecondCounted:TimeInterval = 0
    var background:SKSpriteNode!
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
        pauseOverlay = self.childNode(withName: "pauseOverlay") as! SKSpriteNode
        pauseButton = self.childNode(withName: "pauseButton") as! SKSpriteNode
        continueButton = self.childNode(withName: "continueButton") as! SKSpriteNode
        restartButton = self.childNode(withName: "restartButton") as! SKSpriteNode
        menuButton = self.childNode(withName: "menuButton") as! SKSpriteNode
        volumeButton = self.childNode(withName: "volumeButton") as! SKSpriteNode
        timeLabel = self.childNode(withName: "timeLabel") as! SKLabelNode
        totalTimeLabel = self.childNode(withName: "totalTimeLabel") as! SKLabelNode
        timeOverLabel = self.childNode(withName: "timeOverLabel") as! SKLabelNode
        highScoreLabel = self.childNode(withName: "highScoreLabel") as! SKLabelNode
        scoreLabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
        background = self.childNode(withName: "background") as! SKSpriteNode
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
        pauseOverlay.isHidden = true
        continueButton.isHidden = true
        restartButton.isHidden = true
        menuButton.isHidden = true
        volumeButton.isHidden = true
        pauseOverlay.size.height *= 2
        pauseOverlay.size.width *= 3
        
        block_1.setUpAcceptedBlocks()
        block_2.setUpAcceptedBlocks()
        block_3.setUpAcceptedBlocks()
        block_4.setUpAcceptedBlocks()
        block_5.setUpAcceptedBlocks()
        block_6.setUpAcceptedBlocks()
        block_7.setUpAcceptedBlocks()
        block_8.setUpAcceptedBlocks()
        block_9.setUpAcceptedBlocks()
        block_10.setUpAcceptedBlocks()
        block_11.setUpAcceptedBlocks()
        block_12.setUpAcceptedBlocks()
        block_13.setUpAcceptedBlocks()
        block_14.setUpAcceptedBlocks()
        block_15.setUpAcceptedBlocks()
        block_16.setUpAcceptedBlocks()
        block_17.setUpAcceptedBlocks()
        block_18.setUpAcceptedBlocks()
        block_19.setUpAcceptedBlocks()
        block_20.setUpAcceptedBlocks()
        block_21.setUpAcceptedBlocks()
        block_22.setUpAcceptedBlocks()
        block_23.setUpAcceptedBlocks()
        block_24.setUpAcceptedBlocks()
        block_25.setUpAcceptedBlocks()
        block_26.setUpAcceptedBlocks()
        block_27.setUpAcceptedBlocks()
        block_28.setUpAcceptedBlocks()
        block_29.setUpAcceptedBlocks()
        block_30.setUpAcceptedBlocks()
        block_31.setUpAcceptedBlocks()
        block_32.setUpAcceptedBlocks()
        block_33.setUpAcceptedBlocks()
        block_34.setUpAcceptedBlocks()
        block_35.setUpAcceptedBlocks()
        block_36.setUpAcceptedBlocks()
        toggleVolume()
        toggleVolume()
    }
    
    func touchDown(atPoint pos : CGPoint) {
        let node = self.atPoint(pos)
        
        if node == pauseButton || node == continueButton || node.parent == continueButton {
            self.togglePause()
        } else if node == restartButton || node.parent == restartButton {
            self.restartGame()
            self.togglePause()
        } else if node == menuButton || node.parent == menuButton {
            if last3Games.count < 3 {
                last3Games.append(gameScore)
            } else {
                last3Games.insert(gameScore, at: 2)
                last3Games.removeLast()
            }
            
            print("|| touchDown()")
            print("|| OT: \(elapsedTime)")
            elapsedTime += gamePlayTime
            print("|| NT: \(elapsedTime)")
            defaults.set(last3Games,forKey:"last3Games")
            defaults.set(elapsedTime, forKey: "elapsedTime")
            defaults.set(blocksPopped, forKey: "blocksPopped")
            self.view?.window?.rootViewController?.dismiss(animated: true, completion: {})
        } else if node == volumeButton {
            self.toggleVolume()
        } else {
            if timeOverLabel.isHidden {
                self.safeRemoveBlocks()
                if node is Block {
                    let block = node as! Block
                    if !blockArray.contains(block) {
                        blockArray.append(block)
                        self.colorize(block)
                    }
                } else if node.parent is Block {
                    let block = node.parent as! Block
                    if !blockArray.contains(block) {
                        blockArray.append(block)
                        self.colorize(block)
                    }
                }
            } else {
                restartGame()
            }
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if timeOverLabel.isHidden {
            let node = self.atPoint(pos)
            if node is Block {
                let block = node as! Block
                if !blockArray.contains(block) {
                    blockArray.append(block)
                    self.colorize(block)
                }
            } else if node.parent is Block {
                let block = node.parent as! Block
                if !blockArray.contains(block) {
                    blockArray.append(block)
                    self.colorize(block)
                }
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
                    self.colorize(block)
                }
                self.checkSwipedBlocks()
            } else if node.parent is Block {
                let block = node.parent as! Block
                if !blockArray.contains(block) {
                    blockArray.append(block)
                    self.colorize(block)
                }
                self.checkSwipedBlocks()
            } else {
                if blockArray.count > 2 {
                    self.checkSwipedBlocks()
                } else {
                    self.safeRemoveBlocks()
                }
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
        if blockArray.count >= 3 {
            var x = 0
            let colorToCheckFor = pickColorToCheckFor(0)
            var timeBlockCount = 0
            var scoreBlockCount = 0
            var totalBlocks = blockArray.count
            var blocksAreGood = true
            
            while x < blockArray.count {
                if blockArray[x].currentColor != colorToCheckFor  && blockArray[x].currentColor != "Rainbow"{
                    if x != blockArray.count - 1 {
                        if blockArray[x - 1].acceptedBlocks.contains(blockArray[x + 1]) {
                            self.uncolorize(blockArray[x])
                            blockArray.remove(at: x)
                            totalBlocks = blockArray.count
                            x = 0
                        } else {
                            if blockArray[x].currentColor != "Rainbow" {
                                blocksAreGood = false
                                print("Block #\(blockArray[x].blockID()) couldn't find neighbors :(")
                                print("Block #s \(blockArray[x - 1].blockID()) & \(blockArray[x + 1].blockID())")
                            }
                        }
                    } else {
                        if blockArray.count > 3 {
                            self.uncolorize(blockArray[x])
                            blockArray.remove(at: x)
                            totalBlocks = blockArray.count
                            x = 0
                        } else {
                            blocksAreGood = false
                        }
                    }
                }
                x += 1
            }
            
            if blocksAreGood && blockArray.count >= 3 {
                x = 0
                while x < blockArray.count {
                    if blockArray[x].type == "Bonus_Points" {
                        scoreBlockCount += 1
                    } else if blockArray[x].type == "Bonus_Time" {
                        timeBlockCount += 1
                    }
                    
                    blockArray[x].popAnimation(Double(x + 1))
                    self.uncolorize(blockArray[x])
                    x += 1
                }
                blocksPopped += totalBlocks
                self.safeRemoveBlocks()
                
                let scoreToAdd = (totalBlocks + (scoreBlockCount * 3)) * (totalBlocks - 2) //Ranges from 3-4896
                
                let timeToAdd:Int = timeBlockCount * totalBlocks
                
                self.addTime(timeToAdd)
                self.addScore(scoreToAdd)
            }
        } else {
            self.safeRemoveBlocks()
        }
    }
    
    func safeRemoveBlocks() {
        var x = 0
        while x < blockArray.count {
            self.uncolorize(blockArray[x])
            x += 1
        }
        blockArray.removeAll()
    }
    
    func togglePause() {
        if pauseOverlay.isHidden {
            pauseOverlay.isHidden = false
            continueButton.isHidden = false
            restartButton.isHidden = false
            menuButton.isHidden = false
            volumeButton.isHidden = false
            highScoreLabel.fontColor = .white
            scoreLabel.fontColor = .white
            timeLabel.fontColor = .white
            totalTimeLabel.fontColor = .white
        } else {
            pauseOverlay.isHidden = true
            continueButton.isHidden = true
            restartButton.isHidden = true
            menuButton.isHidden = true
            volumeButton.isHidden = true
            highScoreLabel.fontColor = .gray
            scoreLabel.fontColor = .gray
            timeLabel.fontColor = .gray
            totalTimeLabel.fontColor = .gray
        }
    }
    
    func toggleVolume() {
        soundOn = !soundOn
        if soundOn {
            volumeButton.run(SKAction.setTexture(SKTexture(imageNamed: "Icon_Volume_On")))
        } else {
            volumeButton.run(SKAction.setTexture(SKTexture(imageNamed: "Icon_Volume_Off")))
        }
        defaults.set(soundOn,forKey:"soundOn")
    }
    
    func timeOver() {
        print("|| timeOver()")
        print("|| OT: \(elapsedTime)")
        elapsedTime += gamePlayTime
        print("|| NT: \(elapsedTime)")
        timeOverLabel.isHidden = false
        background.color = .black
        defaults.set(elapsedTime, forKey: "elapsedTime")
        defaults.set(blocksPopped, forKey: "blocksPopped")
        
        if last3Games.count < 3 {
            last3Games.append(gameScore)
        } else {
            last3Games.insert(gameScore, at: 2)
            last3Games.removeLast()
        }
        
        defaults.set(last3Games,forKey:"last3Games")
        self.run(SKAction.wait(forDuration: 0.06),completion:{
            self.block_1.currentColor = "Grey"
            self.massUpdateColor()
            self.run(SKAction.wait(forDuration: 0.06),completion:{
                self.block_2.currentColor = "Grey"
                self.block_7.currentColor = "Grey"
                self.block_8.currentColor = "Grey"
                self.massUpdateColor()
                self.run(SKAction.wait(forDuration: 0.06),completion:{
                    self.block_3.currentColor = "Grey"
                    self.block_9.currentColor = "Grey"
                    self.block_13.currentColor = "Grey"
                    self.block_14.currentColor = "Grey"
                    self.block_15.currentColor = "Grey"
                    self.massUpdateColor()
                    self.run(SKAction.wait(forDuration: 0.06),completion:{
                        self.block_4.currentColor = "Grey"
                        self.block_10.currentColor = "Grey"
                        self.block_16.currentColor = "Grey"
                        self.block_19.currentColor = "Grey"
                        self.block_20.currentColor = "Grey"
                        self.block_21.currentColor = "Grey"
                        self.block_22.currentColor = "Grey"
                        self.massUpdateColor()
                        self.run(SKAction.wait(forDuration: 0.06),completion:{
                            self.block_5.currentColor = "Grey"
                            self.block_11.currentColor = "Grey"
                            self.block_17.currentColor = "Grey"
                            self.block_23.currentColor = "Grey"
                            self.block_29.currentColor = "Grey"
                            self.block_28.currentColor = "Grey"
                            self.block_27.currentColor = "Grey"
                            self.block_26.currentColor = "Grey"
                            self.block_25.currentColor = "Grey"
                            self.massUpdateColor()
                            self.run(SKAction.wait(forDuration: 0.06),completion:{
                                self.block_6.currentColor = "Grey"
                                self.block_12.currentColor = "Grey"
                                self.block_18.currentColor = "Grey"
                                self.block_24.currentColor = "Grey"
                                self.block_30.currentColor = "Grey"
                                self.block_36.currentColor = "Grey"
                                self.block_35.currentColor = "Grey"
                                self.block_34.currentColor = "Grey"
                                self.block_33.currentColor = "Grey"
                                self.block_32.currentColor = "Grey"
                                self.block_31.currentColor = "Grey"
                                self.massUpdateColor()
                            })
                        })
                    })
                })
            })
        })
    }
    
    func restartGame() {
        if gameTime != 0 {
            gameTime = DEFAULT_GAMETIME
            print("|| restartGame()")
            print("|| OT: \(elapsedTime)")
            elapsedTime += gamePlayTime
            print("|| NT: \(elapsedTime)")
            gameScore = 0
            gamePlayTime = 0
            freeSecondPassed = false
            background.color = .white
            defaults.set(elapsedTime, forKey: "elapsedTime")
            defaults.set(blocksPopped, forKey: "blocksPopped")
            self.run(SKAction.wait(forDuration: 0.06),completion:{
                self.block_1.currentColor = "Grey"
                self.massUpdateColor()
                self.run(SKAction.wait(forDuration: 0.06),completion:{
                    self.block_2.currentColor = "Grey"
                    self.block_7.currentColor = "Grey"
                    self.block_8.currentColor = "Grey"
                    self.massUpdateColor()
                    self.run(SKAction.wait(forDuration: 0.06),completion:{
                        self.block_3.currentColor = "Grey"
                        self.block_9.currentColor = "Grey"
                        self.block_13.currentColor = "Grey"
                        self.block_14.currentColor = "Grey"
                        self.block_15.currentColor = "Grey"
                        self.massUpdateColor()
                        self.run(SKAction.wait(forDuration: 0.06),completion:{
                            self.block_4.currentColor = "Grey"
                            self.block_10.currentColor = "Grey"
                            self.block_16.currentColor = "Grey"
                            self.block_19.currentColor = "Grey"
                            self.block_20.currentColor = "Grey"
                            self.block_21.currentColor = "Grey"
                            self.block_22.currentColor = "Grey"
                            self.massUpdateColor()
                            self.run(SKAction.wait(forDuration: 0.06),completion:{
                                self.block_5.currentColor = "Grey"
                                self.block_11.currentColor = "Grey"
                                self.block_17.currentColor = "Grey"
                                self.block_23.currentColor = "Grey"
                                self.block_29.currentColor = "Grey"
                                self.block_28.currentColor = "Grey"
                                self.block_27.currentColor = "Grey"
                                self.block_26.currentColor = "Grey"
                                self.block_25.currentColor = "Grey"
                                self.massUpdateColor()
                                self.run(SKAction.wait(forDuration: 0.06),completion:{
                                    self.block_6.currentColor = "Grey"
                                    self.block_12.currentColor = "Grey"
                                    self.block_18.currentColor = "Grey"
                                    self.block_24.currentColor = "Grey"
                                    self.block_30.currentColor = "Grey"
                                    self.block_36.currentColor = "Grey"
                                    self.block_35.currentColor = "Grey"
                                    self.block_34.currentColor = "Grey"
                                    self.block_33.currentColor = "Grey"
                                    self.block_32.currentColor = "Grey"
                                    self.block_31.currentColor = "Grey"
                                    self.massUpdateColor()
                                    self.run(SKAction.wait(forDuration: 0.04),completion:{
                                        self.timeOverLabel.isHidden = true
                                    })
                                })
                            })
                        })
                    })
                })
            })
        } else {
            if last3Games.count < 3 {
                last3Games.append(gameScore)
            } else {
                last3Games.insert(gameScore, at: 2)
                last3Games.removeLast()
            }
            
            defaults.set(last3Games,forKey:"last3Games")
            gameTime = DEFAULT_GAMETIME
            gameScore = 0
            gamePlayTime = 0
            freeSecondPassed = false
            background.color = .white
            defaults.set(blocksPopped, forKey: "blocksPopped")
            self.run(SKAction.wait(forDuration: 0.06),completion:{
                self.block_1.selectNewColor()
                self.run(SKAction.wait(forDuration: 0.06),completion:{
                    self.block_2.selectNewColor()
                    self.block_7.selectNewColor()
                    self.block_8.selectNewColor()
                    self.run(SKAction.wait(forDuration: 0.06),completion:{
                        self.block_3.selectNewColor()
                        self.block_9.selectNewColor()
                        self.block_13.selectNewColor()
                        self.block_14.selectNewColor()
                        self.block_15.selectNewColor()
                        self.run(SKAction.wait(forDuration: 0.06),completion:{
                            self.block_4.selectNewColor()
                            self.block_10.selectNewColor()
                            self.block_16.selectNewColor()
                            self.block_19.selectNewColor()
                            self.block_20.selectNewColor()
                            self.block_21.selectNewColor()
                            self.block_22.selectNewColor()
                            self.run(SKAction.wait(forDuration: 0.06),completion:{
                                self.block_5.selectNewColor()
                                self.block_11.selectNewColor()
                                self.block_17.selectNewColor()
                                self.block_23.selectNewColor()
                                self.block_29.selectNewColor()
                                self.block_28.selectNewColor()
                                self.block_27.selectNewColor()
                                self.block_26.selectNewColor()
                                self.block_25.selectNewColor()
                                self.run(SKAction.wait(forDuration: 0.06),completion:{
                                    self.block_6.selectNewColor()
                                    self.block_12.selectNewColor()
                                    self.block_18.selectNewColor()
                                    self.block_24.selectNewColor()
                                    self.block_30.selectNewColor()
                                    self.block_36.selectNewColor()
                                    self.block_35.selectNewColor()
                                    self.block_34.selectNewColor()
                                    self.block_33.selectNewColor()
                                    self.block_32.selectNewColor()
                                    self.block_31.selectNewColor()
                                    self.run(SKAction.wait(forDuration: 0.04),completion:{
                                        self.timeOverLabel.isHidden = true
                                    })
                                })
                            })
                        })
                    })
                })
            })
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        if currentTime - lastSecondCounted >= 1 && pauseOverlay.isHidden && timeOverLabel.isHidden {
            lastSecondCounted = currentTime
            gameTime -= 1
            if soundOn && freeSecondPassed {
                if gameTime > 300 {
                    self.run(timeSound_B)
                } else if gameTime > 15 {
                    self.run(timeSound)
                } else if gameTime > 10 {
                    self.run(timeSound_Y)
                } else if gameTime > 5 {
                    self.run(timeSound_O)
                } else {
                    self.run(timeSound_R)
                }
            }
            
            if gameTime <= 0 {
                gameTime = 0
                timeOver()
            } else {
                self.backgroundHeartBeat()
                if gameTime == 60 && !freeSecondPassed {
                    freeSecondPassed = true
                } else {
                    gamePlayTime += 1
                    if gameTime > 300 {
                        if gameTime > 5000 {
                            self.addScore(150)
                        } else if gameTime > 2500 {
                            self.addScore(75)
                        } else if gameTime > 2250 {
                            self.addScore(67)
                        } else if gameTime > 2000 {
                            self.addScore(60)
                        } else if gameTime > 1750 {
                            self.addScore(53)
                        } else if gameTime > 1500 {
                            self.addScore(45)
                        } else if gameTime > 1250 {
                            self.addScore(37)
                        } else if gameTime > 1200 {
                            self.addScore(30)
                        } else if gameTime > 1100 {
                            self.addScore(27)
                        } else if gameTime > 1000 {
                            self.addScore(24)
                        } else if gameTime > 900 {
                            self.addScore(21)
                        } else if gameTime > 800 {
                            self.addScore(18)
                        } else if gameTime > 700 {
                            self.addScore(15)
                        } else if gameTime > 600 {
                            self.addScore(12)
                        } else if gameTime > 500 {
                            self.addScore(9)
                        } else if gameTime > 400 {
                            self.addScore(6)
                        } else {
                            self.addScore(3)
                        }
                        gameTime -= 2
                        
                        if gameTime > 300 {
                            timeLabel.fontColor = .blue
                        } else {
                            timeLabel.fontColor = .gray
                        }
                    } else {
                        timeLabel.fontColor = .gray
                    }
                }
            }
        }
        
        let hoursPassed:Int = gamePlayTime/60/60
        let minutesPassed:Int = gamePlayTime/60 - (hoursPassed * 60)
        let secondsPassed:Int = gamePlayTime - (minutesPassed * 60) - (hoursPassed * 60 * 60)
        
        totalTimeLabel.text = "Total Time: \(hoursPassed)h \(minutesPassed)m \(secondsPassed)s"
        timeLabel.text = "Time: \(gameTime)s"
        scoreLabel.text = "Score: \(gameScore) pts"
        highScoreLabel.text = "Highscore: \(highScore) pts"
        
        if gameScore > highScore {
            highScore = gameScore
            defaults.set(highScore, forKey: "highScore")
        }
        
        if timeOverLabel.isHidden && pauseOverlay.isHidden {
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
    
    func addTime(_ timeToAdd:Int) {
        gameTime += timeToAdd
        let addedTimeLabel = SKLabelNode(text: "+\(timeToAdd)s")
        addedTimeLabel.fontSize = timeLabel.fontSize
        addedTimeLabel.fontName = timeLabel.fontName
        addedTimeLabel.fontColor = .green
        addedTimeLabel.position = timeLabel.position
        addedTimeLabel.horizontalAlignmentMode = timeLabel.horizontalAlignmentMode
        addedTimeLabel.position.y += 25
        self.addChild(addedTimeLabel)
        addedTimeLabel.run(SKAction.moveTo(y: addedTimeLabel.position.y + 100, duration: 1.5), completion: {
            addedTimeLabel.removeFromParent()
        })
    }
    
    func addScore(_ scoreToAdd:Int) {
        gameScore += scoreToAdd
        let addedScoreLabel = SKLabelNode(text: "+\(scoreToAdd) pts")
        addedScoreLabel.fontSize = scoreLabel.fontSize
        addedScoreLabel.fontName = scoreLabel.fontName
        addedScoreLabel.fontColor = .green
        addedScoreLabel.position = scoreLabel.position
        addedScoreLabel.horizontalAlignmentMode = scoreLabel.horizontalAlignmentMode
        addedScoreLabel.position.y += 25
        self.addChild(addedScoreLabel)
        addedScoreLabel.run(SKAction.moveTo(y: addedScoreLabel.position.y + 100, duration: 1.5), completion: {
            addedScoreLabel.removeFromParent()
        })
    }
    
    func colorize(_ block:Block) {
        block.run(SKAction.fadeAlpha(to: 0.45, duration: 0.2))
    }
    
    func uncolorize(_ block:Block) {
        block.run(SKAction.fadeAlpha(to: 1, duration: 0.2))
    }
    
    func backgroundHeartBeat() {
        if gameTime < 6 {
            background.run(SKAction.colorize(with: .red, colorBlendFactor: 1.0, duration: 0.48),completion:{
                self.background.run(SKAction.colorize(with: .white, colorBlendFactor: 1.0, duration: 0.48))
            })
        } else if gameTime < 11 {
            background.run(SKAction.colorize(with: .orange, colorBlendFactor: 1.0, duration: 0.48),completion:{
                self.background.run(SKAction.colorize(with: .white, colorBlendFactor: 1.0, duration: 0.48))
            })
        } else if gameTime < 16 {
            background.run(SKAction.colorize(with: .yellow, colorBlendFactor: 1.0, duration: 0.48),completion:{
                self.background.run(SKAction.colorize(with: .white, colorBlendFactor: 1.0, duration: 0.48))
            })
        }
    }
    
    func massUpdateColor() {
        block_1.updateColor()
        block_2.updateColor()
        block_3.updateColor()
        block_4.updateColor()
        block_5.updateColor()
        block_6.updateColor()
        block_7.updateColor()
        block_8.updateColor()
        block_9.updateColor()
        block_10.updateColor()
        block_11.updateColor()
        block_12.updateColor()
        block_13.updateColor()
        block_14.updateColor()
        block_15.updateColor()
        block_16.updateColor()
        block_17.updateColor()
        block_18.updateColor()
        block_19.updateColor()
        block_20.updateColor()
        block_21.updateColor()
        block_22.updateColor()
        block_23.updateColor()
        block_24.updateColor()
        block_25.updateColor()
        block_26.updateColor()
        block_27.updateColor()
        block_28.updateColor()
        block_29.updateColor()
        block_30.updateColor()
        block_31.updateColor()
        block_32.updateColor()
        block_33.updateColor()
        block_34.updateColor()
        block_35.updateColor()
        block_36.updateColor()
    }
}
