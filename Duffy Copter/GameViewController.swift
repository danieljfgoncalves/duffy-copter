//
//  GameViewController.swift
//  Duffy Copter
//
//  Created by Daniel Goncalves on 2015-05-20.
//  Copyright (c) 2015 Daniel J Goncalves. All rights reserved.
//

import UIKit
import SpriteKit

extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController {
    
    // Properties
    var bottomObstacles = []
    var topObstacles = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            // Configure the view.
            let skView = self.view as! SKView
            
            // Debug Settings
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.showsPhysics = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
                // Resizes view size depending on device
            scene.size = skView.bounds.size
            
            // Preloading Obstacle Textures
                // Top
            var greenTopTexture = SKTexture(imageNamed: "obstacles/greenTop.png")
            var icyTopTexture = SKTexture(imageNamed: "obstacles/icyTop.png")
            var pinkTopTexture = SKTexture(imageNamed: "obstacles/pinkTop.png")
            var yellowTopTexture = SKTexture(imageNamed: "obstacles/yellowTop.png")
                // Bottom
            var greenBottomTexture = SKTexture(imageNamed: "obstacles/greenBottom.png")
            var icyBottomTexture = SKTexture(imageNamed: "obstacles/icyBottom.png")
            var pinkBottomTexture = SKTexture(imageNamed: "obstacles/pinkBottom.png")
            var yellowBottomTexture = SKTexture(imageNamed: "obstacles/yellowBottom.png")
                // Arrays
            self.bottomObstacles =  [greenBottomTexture, icyBottomTexture, pinkBottomTexture, yellowBottomTexture]
            self.topObstacles =     [greenTopTexture, icyTopTexture, pinkTopTexture, yellowTopTexture]

            SKTexture.preloadTextures(self.bottomObstacles as [AnyObject], withCompletionHandler: { () -> Void in
                SKTexture.preloadTextures(self.topObstacles as [AnyObject], withCompletionHandler: { () -> Void in
                    scene.bottomObstacles = self.bottomObstacles as? [SKTexture]
                    scene.topObstacles = self.topObstacles as? [SKTexture]
                    dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                        
                        // After Loading Textures Load View
                         skView.presentScene(scene)
                    })
                    
               })
            })
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
