//
//  MainViewController.swift
//  Pop Blocks
//
//  Created by Bryan Mazariegos on 6/1/17.
//  Copyright © 2017 Bryan Mazariegos. All rights reserved.
//

import UIKit
import GameKit
import AVFoundation
import StoreKit

let defaults = UserDefaults.standard
let FULL_GAME_ID = "com.Mazariegos.PoofyBlocks.FullVersion"
var productID = ""
var productsRequests:SKProductsRequest!
var iapProducts = [SKProduct]()
var ncPurchaseMade = defaults.bool(forKey: "ncPurchaseMade")
var _enableGameCenter = true
var _authVC:UIViewController?
var attemptedAuth = false
var appDelegate:AppDelegate!
var GK_TRAFFIC_HANDLER:GKTrafficHandler!
var playerName = ""
var DEFAULT_LB = ""
var LB_ID_SCORE = "PoofyBlocks_Highest_Score"
var LB_ID_TIME = "PoofyBlocks_Longest_Time"
var mVC:MainViewController!
var player = AVAudioPlayer()

class MainViewController: UIViewController,SKProductsRequestDelegate,SKPaymentTransactionObserver {
    @IBOutlet var iconDistance: NSLayoutConstraint!
    @IBOutlet var playDistance: NSLayoutConstraint!
    
    @IBOutlet var leftBtn: UIButton!
    @IBOutlet var rightBtn: UIButton!
    @IBOutlet var playBtn: UIButton!
    @IBOutlet var buyBtn: UIButton!
    @IBOutlet var leadersBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBtn.titleLabel?.text = gameMode
        if ncPurchaseMade {
            print("Premium version PURCHASED!")
            buyBtn.isHidden = true
        } else {
            print("Premium version LOCKED!")
        }
        // Fetch IAP Products available
        fetchAvailableProducts()
        
        mVC = self
        let path = Bundle.main.path(forResource: "buttonForward", ofType: "m4a")!
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        } catch {
            
        }
        player.numberOfLoops = 0
        player.prepareToPlay()
        
        if GK_TRAFFIC_HANDLER == nil {
            GK_TRAFFIC_HANDLER = GKTrafficHandler()
        }
        
        if !attemptedAuth {
            attemptedAuth = true
            GK_TRAFFIC_HANDLER.authLocalPlayer()
        }
        
        UIView.animate(withDuration: 2.5) {
            self.iconDistance.constant = 45
            self.playDistance.constant = 48
            self.view.layoutIfNeeded()
        }
    }
    
    func fetchAvailableProducts()  {
        SKPaymentQueue.default().add(self)
        let productIdentifiers = NSSet(objects:FULL_GAME_ID)
        productsRequests = SKProductsRequest(productIdentifiers: productIdentifiers as! Set<String>)
        productsRequests.delegate = self
        productsRequests.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if (response.products.count > 0) {
            iapProducts = response.products
            
            let firstProduct = response.products[0] as SKProduct
            let numberFormatter = NumberFormatter()
            numberFormatter.formatterBehavior = .behavior10_4
            numberFormatter.numberStyle = .currency
            numberFormatter.locale = firstProduct.priceLocale
            let price1Str = numberFormatter.string(from: firstProduct.price)
            print("Product: \(firstProduct.productIdentifier) @ \(price1Str!)")
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction:AnyObject in transactions {
            if let trans = transaction as? SKPaymentTransaction {
                switch trans.transactionState {
                case .purchased:
                    SKPaymentQueue.default().finishTransaction(trans)
                    if productID == FULL_GAME_ID {
                        ncPurchaseMade = true
                        defaults.set(ncPurchaseMade, forKey: "ncPurchaseMade")
                        
                        UIAlertView(title: "Success!",
                                    message: "You've unlocked the full game!",
                                    delegate: nil,
                                    cancelButtonTitle: "OK").show()
                        checkIfModeAvailable()
                    } else {
                        print("WTF")
                    }
                    
                    break
                    
                case .failed:
                    SKPaymentQueue.default().finishTransaction(trans)
                    print("WTF-FAILED CASE")
                    print(trans.error)
                    print(trans.payment.productIdentifier)
                    break
                case .restored:
                    SKPaymentQueue.default().finishTransaction(trans)
                    break
                    
                default:
                    print("WTF-DEFAULT CASE")
                    break
                }
            }
        }
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        if (queue.transactions.count == 0) {
            UIAlertView(title: "Nothing to restore...",
                        message: "We didn't find any purchases under this Apple ID.",
                        delegate: nil, cancelButtonTitle: "Okay").show()
        } else {
            if queue.transactions[0].payment.productIdentifier == FULL_GAME_ID {
                ncPurchaseMade = true
                defaults.set(ncPurchaseMade, forKey: "ncPurchaseMade")
                
                UIAlertView(title: "Features Restored!",
                            message: "The full game is now unlocked.",
                            delegate: nil, cancelButtonTitle: "Thanks!").show()
                checkIfModeAvailable()
            }
        }
    }
    
    func canMakePurchases() -> Bool {
        return SKPaymentQueue.canMakePayments()
    }
    
    func purchaseMyProduct(product: SKProduct) {
        if self.canMakePurchases() {
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().add(payment)
            
            print("PRODUCT TO PURCHASE: \(product.productIdentifier)")
            productID = product.productIdentifier
        } else {
            UIAlertView(title: "Purchase failed. :/",
                        message: "Purchases are disabled in your device!",
                        delegate: nil, cancelButtonTitle: "OK").show()
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
    
    @IBAction func nextMode() {
        if gameMode == "Normal" {
            gameMode = "Shuffle"
            leftBtn.isEnabled = true
        } else if gameMode == "Shuffle" {
            gameMode = "Spin"
        } else if gameMode == "Spin" {
            gameMode = "Flip"
        } else if gameMode == "Flip" {
            gameMode = "Fragile"
            rightBtn.isEnabled = false
        }
        
        playBtn.setTitle(gameMode, for: .highlighted)
        playBtn.setTitle(gameMode, for: .selected)
        playBtn.setTitle(gameMode, for: .normal)
        playSound()
        checkIfModeAvailable()
    }
    
    @IBAction func previousMode() {
        if gameMode == "Shuffle" {
            gameMode = "Normal"
            leftBtn.isEnabled = false
        } else if gameMode == "Spin" {
            gameMode = "Shuffle"
        } else if gameMode == "Flip" {
            gameMode = "Spin"
        } else if gameMode == "Fragile" {
            gameMode = "Flip"
            rightBtn.isEnabled = true
        }
        
        playBtn.setTitle(gameMode, for: .highlighted)
        playBtn.setTitle(gameMode, for: .selected)
        playBtn.setTitle(gameMode, for: .normal)
        playSound()
        checkIfModeAvailable()
    }
    
    @IBAction func openLB() {
        GK_TRAFFIC_HANDLER.submitHighScores()
        
        let gcVC = GKGameCenterViewController()
        gcVC.gameCenterDelegate = GK_TRAFFIC_HANDLER
        gcVC.viewState = .leaderboards
        gcVC.leaderboardIdentifier = LB_ID_SCORE
        self.present(gcVC, animated: true, completion: nil)
        playSound()
    }
    
    @IBAction func playSound() {
        if soundOn {
            player.play()
        }
    }
    
    func checkIfModeAvailable() {
        if !ncPurchaseMade && gameMode != "Normal" {
            playBtn.isEnabled = false
            buyBtn.setTitle("Buy Full Game", for: .highlighted)
            buyBtn.setTitle("Buy Full Game", for: .selected)
            buyBtn.setTitle("Buy Full Game", for: .normal)
        } else {
            playBtn.isEnabled = true
            if !ncPurchaseMade {
                buyBtn.isHidden = false
                if gameMode != "Normal" {
                    buyBtn.setTitle("Buy Full Game", for: .highlighted)
                    buyBtn.setTitle("Buy Full Game", for: .selected)
                    buyBtn.setTitle("Buy Full Game", for: .normal)
                } else {
                    buyBtn.setTitle("Restore", for: .highlighted)
                    buyBtn.setTitle("Restore", for: .selected)
                    buyBtn.setTitle("Restore", for: .normal)
                }
            } else {
                buyBtn.isHidden = true
            }
        }
    }
    
    @IBAction func restoreFullGame() {
        if buyBtn.titleLabel?.text == "Restore" {
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().restoreCompletedTransactions()
        } else {
            purchaseMyProduct(product: iapProducts[0])
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
