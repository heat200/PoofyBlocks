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
var longestGame = 0
var elapsedTime = 0

var highScore_Shuffle = 0
var longestGame_Shuffle = 0

var highScore_Spin = 0
var longestGame_Spin = 0

var highScore_Flip = 0
var longestGame_Flip = 0

var highScore_Fragile = 0
var longestGame_Fragile = 0

var soundOn = true
var blocksPopped = 0
var gameMode = "Normal"

class GameScene: SKScene {
    private var lastUpdateTime : TimeInterval = 0
    var timeSound_B = SKAction.playSoundFileNamed("timeSound_B.m4a", waitForCompletion: false)
    var timeSound = SKAction.playSoundFileNamed("timeSound.m4a", waitForCompletion: false)
    var timeSound_Y = SKAction.playSoundFileNamed("timeSound_Y.m4a", waitForCompletion: false)
    var timeSound_O = SKAction.playSoundFileNamed("timeSound_O.m4a", waitForCompletion: false)
    var timeSound_R = SKAction.playSoundFileNamed("timeSound_R.m4a", waitForCompletion: false)
    var blockSound = SKAction.playSoundFileNamed("popSound.m4a", waitForCompletion: false)
    var blockSound2 = SKAction.playSoundFileNamed("blockScale.m4a", waitForCompletion: false)
    var blockSound3 = SKAction.playSoundFileNamed("buttonBack.m4a", waitForCompletion: false)
    var buttonSound = SKAction.playSoundFileNamed("buttonForward.m4a", waitForCompletion: false)
    var specialSound = SKAction.playSoundFileNamed("shuffleSound.m4a", waitForCompletion: false)
    var specialSound2 = SKAction.playSoundFileNamed("shuffleSound2.m4a", waitForCompletion: false)
    var blockArray = [Block]()
    var blockList = [Block]()
    var blockLayers = [[Block](),[Block](),[Block]()]
    var firstMoveDone = false
    var randLapse = 1
    var randMod = 0
    var hintLapse = 1
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
    var blockHolder:SKSpriteNode!
    
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
        blockHolder = self.childNode(withName: "blockHolder") as! SKSpriteNode
        block_1 = blockHolder.childNode(withName: "block_1") as! Block
        block_2 = blockHolder.childNode(withName: "block_2") as! Block
        block_3 = blockHolder.childNode(withName: "block_3") as! Block
        block_4 = blockHolder.childNode(withName: "block_4") as! Block
        block_5 = blockHolder.childNode(withName: "block_5") as! Block
        block_6 = blockHolder.childNode(withName: "block_6") as! Block
        block_7 = blockHolder.childNode(withName: "block_7") as! Block
        block_8 = blockHolder.childNode(withName: "block_8") as! Block
        block_9 = blockHolder.childNode(withName: "block_9") as! Block
        block_10 = blockHolder.childNode(withName: "block_10") as! Block
        block_11 = blockHolder.childNode(withName: "block_11") as! Block
        block_12 = blockHolder.childNode(withName: "block_12") as! Block
        block_13 = blockHolder.childNode(withName: "block_13") as! Block
        block_14 = blockHolder.childNode(withName: "block_14") as! Block
        block_15 = blockHolder.childNode(withName: "block_15") as! Block
        block_16 = blockHolder.childNode(withName: "block_16") as! Block
        block_17 = blockHolder.childNode(withName: "block_17") as! Block
        block_18 = blockHolder.childNode(withName: "block_18") as! Block
        block_19 = blockHolder.childNode(withName: "block_19") as! Block
        block_20 = blockHolder.childNode(withName: "block_20") as! Block
        block_21 = blockHolder.childNode(withName: "block_21") as! Block
        block_22 = blockHolder.childNode(withName: "block_22") as! Block
        block_23 = blockHolder.childNode(withName: "block_23") as! Block
        block_24 = blockHolder.childNode(withName: "block_24") as! Block
        block_25 = blockHolder.childNode(withName: "block_25") as! Block
        block_26 = blockHolder.childNode(withName: "block_26") as! Block
        block_27 = blockHolder.childNode(withName: "block_27") as! Block
        block_28 = blockHolder.childNode(withName: "block_28") as! Block
        block_29 = blockHolder.childNode(withName: "block_29") as! Block
        block_30 = blockHolder.childNode(withName: "block_30") as! Block
        block_31 = blockHolder.childNode(withName: "block_31") as! Block
        block_32 = blockHolder.childNode(withName: "block_32") as! Block
        block_33 = blockHolder.childNode(withName: "block_33") as! Block
        block_34 = blockHolder.childNode(withName: "block_34") as! Block
        block_35 = blockHolder.childNode(withName: "block_35") as! Block
        block_36 = blockHolder.childNode(withName: "block_36") as! Block
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
        
        blockList.append(block_1)
        blockList.append(block_2)
        blockList.append(block_3)
        blockList.append(block_4)
        blockList.append(block_5)
        blockList.append(block_6)
        blockList.append(block_7)
        blockList.append(block_8)
        blockList.append(block_9)
        blockList.append(block_10)
        blockList.append(block_11)
        blockList.append(block_12)
        blockList.append(block_13)
        blockList.append(block_14)
        blockList.append(block_15)
        blockList.append(block_16)
        blockList.append(block_17)
        blockList.append(block_18)
        blockList.append(block_19)
        blockList.append(block_20)
        blockList.append(block_21)
        blockList.append(block_22)
        blockList.append(block_23)
        blockList.append(block_24)
        blockList.append(block_25)
        blockList.append(block_26)
        blockList.append(block_27)
        blockList.append(block_28)
        blockList.append(block_29)
        blockList.append(block_30)
        blockList.append(block_31)
        blockList.append(block_32)
        blockList.append(block_33)
        blockList.append(block_34)
        blockList.append(block_35)
        blockList.append(block_36)
        
        setUpLayers()
        print("GM: \(gameMode)")
    }
    
    func touchDown(atPoint pos:CGPoint) {
        let node = self.atPoint(pos)
        
        if node == pauseButton || node == continueButton || node.parent == continueButton {
            if soundOn {
                self.run(blockSound3)
            }
            self.togglePause()
        } else if node == restartButton || node.parent == restartButton {
            if soundOn {
                self.run(blockSound3)
            }
            self.restartGame()
            self.togglePause()
        } else if node == menuButton || node.parent == menuButton {
            if soundOn {
                self.run(blockSound3)
            }
            elapsedTime += gamePlayTime
            defaults.set(elapsedTime, forKey: "elapsedTime")
            defaults.set(blocksPopped, forKey: "blocksPopped")
            self.view?.window?.rootViewController?.dismiss(animated: true, completion: {})
        } else if node == volumeButton {
            self.toggleVolume()
            if soundOn {
                self.run(blockSound3)
            }
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
                                /*
                                print("Block #\(blockArray[x].blockID()) couldn't find neighbors :(")
                                print("Block #s \(blockArray[x - 1].blockID()) & \(blockArray[x + 1].blockID())")
                                 */
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
                if !firstMoveDone {
                    firstMoveDone = true
                }
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
    
    func fragilize(_ block:Block) {
        if block.xScale >= 0.2 {
            var newScale = block.xScale - 0.2
            if newScale < 0 {
                newScale = 0
            }
            block.run(SKAction.scale(to: newScale, duration: 0.5))
            if soundOn {
                self.run(blockSound)
            }
        }
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
        elapsedTime += gamePlayTime
        timeOverLabel.isHidden = false
        background.color = .black
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
            elapsedTime += gamePlayTime
            gameScore = 0
            gamePlayTime = 0
            randMod = 0
            freeSecondPassed = false
            firstMoveDone = false
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
            gameTime = DEFAULT_GAMETIME
            elapsedTime += gamePlayTime
            gameScore = 0
            gamePlayTime = 0
            randMod = 0
            freeSecondPassed = false
            firstMoveDone = false
            background.color = .white
            defaults.set(elapsedTime, forKey: "elapsedTime")
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
            if gameMode != "Fragile" {
                gameTime -= 1
            }
            
            if gameTime <= 0 {
                gameTime = 0
                timeOver()
            } else {
                self.backgroundHeartBeat()
                if gameTime == 60 && !freeSecondPassed {
                    freeSecondPassed = true
                } else {
                    if randLapse <= 0 {
                        if gameMode == "Shuffle" && blockArray.count == 0 {
                            randLapse = Int(arc4random_uniform(3) + 1)
                            shuffleLayers()
                        } else if gameMode == "Flip" && blockArray.count == 0 {
                            randLapse = Int(arc4random_uniform(3) + 1)
                            let rand = Int(arc4random_uniform(2) + 1)
                            if rand == 1 {
                                blockHolder.run(SKAction.scaleX(to: blockHolder.xScale * -1, duration: 0.5))
                            } else {
                                blockHolder.run(SKAction.scaleY(to: blockHolder.yScale * -1, duration: 0.5))
                            }
                            
                            if soundOn {
                                self.run(specialSound)
                            }
                        } else if gameMode == "Spin" && blockArray.count == 0 {
                            randLapse = Int(arc4random_uniform(3) + 1)
                            let rand = Int(arc4random_uniform(2) + 1)
                            let direction = Int(arc4random_uniform(2) + 1)
                            if direction == 1 {
                                blockHolder.run(SKAction.rotate(byAngle: CGFloat(Double.pi * Double(rand)), duration: 0.5))
                            } else {
                                blockHolder.run(SKAction.rotate(byAngle: CGFloat(Double.pi * Double(-rand)), duration: 0.5))
                            }
                            
                            if soundOn {
                                self.run(specialSound2)
                            }
                        } else if gameMode == "Fragile" {
                            randLapse = Int(arc4random_uniform(5) + 1) //1-5s between each round
                            let rand = Int(arc4random_uniform(3)) //+0 to 2 fragilized blocks each round
                            randMod += rand
                            var x = 0
                            while x < randMod {
                                fragilize(selectRandomBlock())
                                x += 1
                            }
                            
                            checkSpecialLoss()
                        }
                    }
                    randLapse -= 1
                    
                    if hintLapse >= 2 {
                        hintLapse = 0
                        if gameMode == "Normal" {
                            if !firstMoveDone {
                                highlightFirstMove(0)
                            }
                        }
                    }
                    
                    hintLapse += 1
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
        if gameMode != "Fragile" {
            timeLabel.text = "Time: \(gameTime)s"
        } else {
            timeLabel.text = "Time: ∞"
        }
        scoreLabel.text = "Score: \(gameScore) pts"
        
        if gameMode == "Normal" {
            highScoreLabel.text = "Highscore: \(highScore) pts"
        } else if gameMode == "Shuffle" {
            highScoreLabel.text = "Highscore: \(highScore_Shuffle) pts"
        } else if gameMode == "Spin" {
            highScoreLabel.text = "Highscore: \(highScore_Spin) pts"
        } else if gameMode == "Flip" {
            highScoreLabel.text = "Highscore: \(highScore_Flip) pts"
        } else if gameMode == "Fragile" {
            highScoreLabel.text = "Highscore: \(highScore_Fragile) pts"
        }
        
        saveHighscores()
        
        if timeOverLabel.isHidden && pauseOverlay.isHidden {
            var x = 0
            while x < 36 {
                blockList[x].selectNewColor()
                x += 1
            }
        }
        self.lastUpdateTime = currentTime
    }
    
    func addTime(_ timeToAdd:Int) {
        if gameMode != "Fragile" {
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
    
    func checkSpecialLoss() {
        if gameMode == "Fragile" {
            var x = 0
            var blockCount_Red = 0
            var blockCount_Blue = 0
            var blockCount_Green = 0
            var blockCount_Yellow = 0
            var blockCount_Purple = 0
            while x < blockList.count {
                if blockList[x].xScale >= 0.2  {
                    if blockList[x].currentColor == "Red" {
                        blockCount_Red += 1
                    } else if blockList[x].currentColor == "Blue" {
                        blockCount_Blue += 1
                    } else if blockList[x].currentColor == "Green" {
                        blockCount_Green += 1
                    } else if blockList[x].currentColor == "Yellow" {
                        blockCount_Yellow += 1
                    } else if blockList[x].currentColor == "Purple" {
                        blockCount_Purple += 1
                    } else if blockList[x].currentColor == "Rainbow" {
                        blockCount_Red += 1
                        blockCount_Blue += 1
                        blockCount_Green += 1
                        blockCount_Yellow += 1
                        blockCount_Purple += 1
                    }
                }
                
                x += 1
            }
            
            if blockCount_Red > 5 || blockCount_Blue > 5 || blockCount_Green > 5 || blockCount_Yellow > 5 || blockCount_Purple > 5 {
                gameTime = 60
            } else if blockCount_Red > 4 || blockCount_Blue > 4 || blockCount_Green > 4 || blockCount_Yellow > 4 || blockCount_Purple > 4 {
                gameTime = 15
            } else if blockCount_Red > 3 || blockCount_Blue > 3 || blockCount_Green > 3 || blockCount_Yellow > 3 || blockCount_Purple > 3 {
                gameTime = 10
            } else if blockCount_Red > 2 || blockCount_Blue > 2 || blockCount_Green > 2 || blockCount_Yellow > 2 || blockCount_Purple > 2 {
                gameTime = 5
            } else {
                gameTime = 0
            }
        }
    }
    
    func saveHighscores() {
        if gameMode == "Normal" {
            if gameScore > highScore {
                highScore = gameScore
                defaults.set(highScore, forKey: "highScore")
            }
            
            if gamePlayTime > longestGame {
                longestGame = gamePlayTime
                defaults.set(longestGame, forKey: "longestGame")
            }
        } else if gameMode == "Shuffle" {
            if gameScore > highScore_Shuffle {
                highScore_Shuffle = gameScore
                defaults.set(highScore_Shuffle, forKey: "highScore_Shuffle")
            }
            
            if gamePlayTime > longestGame_Shuffle {
                longestGame_Shuffle = gamePlayTime
                defaults.set(longestGame_Shuffle, forKey: "longestGame_Shuffle")
            }
        } else if gameMode == "Spin" {
            if gameScore > highScore_Spin {
                highScore_Spin = gameScore
                defaults.set(highScore_Spin, forKey: "highScore_Spin")
            }
            
            if gamePlayTime > longestGame_Spin {
                longestGame_Spin = gamePlayTime
                defaults.set(longestGame_Spin, forKey: "longestGame_Spin")
            }
        } else if gameMode == "Flip" {
            if gameScore > highScore_Flip {
                highScore_Flip = gameScore
                defaults.set(highScore_Flip, forKey: "highScore_Flip")
            }
            
            if gamePlayTime > longestGame_Flip {
                longestGame_Flip = gamePlayTime
                defaults.set(longestGame_Flip, forKey: "longestGame_Flip")
            }
        } else if gameMode == "Fragile" {
            if gameScore > highScore_Fragile {
                highScore_Fragile = gameScore
                defaults.set(highScore_Fragile, forKey: "highScore_Fragile")
            }
            
            if gamePlayTime > longestGame_Fragile {
                longestGame_Fragile = gamePlayTime
                defaults.set(longestGame_Fragile, forKey: "longestGame_Fragile")
            }
        }
    }
    
    func colorize(_ block:Block) {
        block.run(SKAction.fadeAlpha(to: 0.45, duration: 0.2))
        if soundOn {
            self.run(blockSound3)
        }
    }
    
    func uncolorize(_ block:Block) {
        block.run(SKAction.fadeAlpha(to: 1, duration: 0.2))
    }
    
    func hintScale(_ block:Block) {
        block.run(SKAction.scale(to: 0.75, duration: 0.15))
        if soundOn {
            self.run(blockSound2)
        }
    }
    
    func hintDescale(_ block:Block) {
        block.run(SKAction.scale(to: 1.0, duration: 0.15))
    }
    
    func backgroundHeartBeat() {
        if soundOn && freeSecondPassed {
            if gameTime > 300 {
                self.run(timeSound_B)
            } else if gameTime > 15 {
                if gameMode != "Fragile" {
                    self.run(timeSound)
                }
            } else if gameTime > 10 {
                self.run(timeSound_Y)
            } else if gameTime > 5 {
                self.run(timeSound_O)
            } else {
                self.run(timeSound_R)
            }
        }
        
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
    
    func highlightFirstMove(_ refBlock:Int) {
        var highlightArray = [Block]()
        highlightArray.append(self.blockList[refBlock])
        highlightArray = self.deepenHighlightArray(self.blockList[refBlock], oldHighlightArray: highlightArray)
        
        if highlightArray.count < 3 {
            highlightFirstMove(refBlock + 1)
        } else if self.blockList[refBlock].currentColor != "Grey" {
            var blockHigh = 0
            var timeOffset:Double = 0
            while blockHigh < highlightArray.count {
                let localBlock = highlightArray[blockHigh]
                print(localBlock.blockID())
                if !blockArray.contains(localBlock) {
                    timeOffset += 1
                    self.run(SKAction.wait(forDuration: 0.1 * timeOffset),completion:{
                        self.hintScale(localBlock)
                        self.run(SKAction.wait(forDuration: 0.35),completion:{
                            self.hintDescale(localBlock)
                        })
                    })
                }
                blockHigh += 1
            }
        }
    }
    
    func deepenHighlightArray(_ fromBlock:Block, oldHighlightArray:[Block]) -> [Block] {
        var x = 0
        var newHighlightArray = oldHighlightArray
        while x < fromBlock.trueNeighbors.count {
            if fromBlock.trueNeighbors[x].currentColor == fromBlock.currentColor || fromBlock.trueNeighbors[x].currentColor == "Rainbow" {
                if !newHighlightArray.contains(fromBlock.trueNeighbors[x]) {
                    newHighlightArray.append(fromBlock.trueNeighbors[x])
                    newHighlightArray = self.deepenHighlightArray(fromBlock.trueNeighbors[x], oldHighlightArray: newHighlightArray)
                } else {
                    print("Couldn't add block #\(fromBlock.trueNeighbors[x].blockID())")
                }
            }
            x += 1
        }
        
        return newHighlightArray
    }
    
    func selectRandomBlock() -> Block {
        let choice = Int(arc4random_uniform(36))
        var block = blockList[choice]
        
        if blockArray.contains(block) {
            block = selectRandomBlock()
        }
        
        return blockList[choice]
    }
    
    func massUpdateColor() {
        var x = 0
        while x < 36 {
            blockList[x].updateColor()
            blockList[x].setScale(1)
            x += 1
        }
    }
    
    func setUpLayers() {
        blockLayers[0].append(block_1)
        blockLayers[0].append(block_2)
        blockLayers[0].append(block_3)
        blockLayers[0].append(block_4)
        blockLayers[0].append(block_5)
        blockLayers[0].append(block_6)
        blockLayers[0].append(block_7)
        blockLayers[0].append(block_12)
        blockLayers[0].append(block_13)
        blockLayers[0].append(block_18)
        blockLayers[0].append(block_19)
        blockLayers[0].append(block_24)
        blockLayers[0].append(block_25)
        blockLayers[0].append(block_30)
        blockLayers[0].append(block_31)
        blockLayers[0].append(block_32)
        blockLayers[0].append(block_33)
        blockLayers[0].append(block_34)
        blockLayers[0].append(block_35)
        blockLayers[0].append(block_36)
        
        blockLayers[1].append(block_8)
        blockLayers[1].append(block_9)
        blockLayers[1].append(block_10)
        blockLayers[1].append(block_11)
        blockLayers[1].append(block_14)
        blockLayers[1].append(block_20)
        blockLayers[1].append(block_26)
        blockLayers[1].append(block_27)
        blockLayers[1].append(block_28)
        blockLayers[1].append(block_29)
        blockLayers[1].append(block_23)
        blockLayers[1].append(block_17)
        
        blockLayers[2].append(block_15)
        blockLayers[2].append(block_16)
        blockLayers[2].append(block_21)
        blockLayers[2].append(block_22)
    }
    
    func shuffleLayers() {
        let L1_ANIM_LEN:Double = 0.75
        let L2_ANIM_LEN:Double = 0.6
        let L3_ANIM_LEN:Double = 0.45
        
        var layer_pos = 0
        while layer_pos < blockLayers[0].count {
            if layer_pos != blockLayers[0].count - 1 {
                blockLayers[0][layer_pos].run(SKAction.move(to: blockLayers[0][layer_pos + 1].position, duration: L1_ANIM_LEN))
            } else {
                blockLayers[0][layer_pos].run(SKAction.move(to: blockLayers[0][0].position, duration: L1_ANIM_LEN))
            }
            layer_pos += 1
            
            if soundOn {
                if layer_pos % 2 == 0 {
                    self.run(specialSound)
                } else {
                    self.run(specialSound2)
                }
            }
        }
        
        layer_pos = 0
        while layer_pos < blockLayers[1].count {
            if layer_pos != blockLayers[1].count - 1 {
                blockLayers[1][layer_pos].run(SKAction.move(to: blockLayers[1][layer_pos + 1].position, duration: L2_ANIM_LEN))
            } else {
                blockLayers[1][layer_pos].run(SKAction.move(to: blockLayers[1][0].position, duration: L2_ANIM_LEN))
            }
            layer_pos += 1
            
            if soundOn {
                if layer_pos % 2 == 0 {
                    self.run(specialSound)
                } else {
                    self.run(specialSound2)
                }
            }
        }
        
        layer_pos = 0
        while layer_pos < blockLayers[2].count {
            if layer_pos != blockLayers[2].count - 1 {
                blockLayers[2][layer_pos].run(SKAction.move(to: blockLayers[2][layer_pos + 1].position, duration: L3_ANIM_LEN))
            } else {
                blockLayers[2][layer_pos].run(SKAction.move(to: blockLayers[2][0].position, duration: L3_ANIM_LEN))
            }
            layer_pos += 1
            
            if soundOn {
                if layer_pos % 2 == 0 {
                    self.run(specialSound)
                } else {
                    self.run(specialSound2)
                }
            }
        }
    }
}
