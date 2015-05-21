//
//  GameScene.swift
//  Duffy Copter
//
//  Created by Daniel Goncalves on 2015-05-20.
//  Copyright (c) 2015 Daniel J Goncalves. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // Set SpriteNodes
        // Set Duffy
    var duffy = SKSpriteNode()
        // Set Obstacule Textures arrays
    var bottomObstacles:[SKTexture]!
    var topObstacles: [SKTexture]!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        // Config Scene Boundaries
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        
//        // Set Obstacle Textextures
//            // Top Textures
//        var greenTopTexture = SKTexture(imageNamed: "obstacles/greenTop.png")
//        var icyTopTexture = SKTexture(imageNamed: "obstacles/icyTop.png")
//        var pinkTopTexture = SKTexture(imageNamed: "obstacles/pinkTop.png")
//        var yellowTopTexture = SKTexture(imageNamed: "obstacles/yellowTop.png")
//            // Bottom Textures
//        var greenBottomTexture = SKTexture(imageNamed: "obstacles/greenBottom.png")
//        var icyBottomTexture = SKTexture(imageNamed: "obstacles/icyBottom.png")
//        var pinkBottomTexture = SKTexture(imageNamed: "obstacles/pinkBottom.png")
//        var yellowBottomTexture = SKTexture(imageNamed: "obstacles/yellowBottom.png")
        
//        self.bottomObstacles =   [greenBottomTexture, icyBottomTexture, pinkBottomTexture, yellowBottomTexture]
//        self.topObstacles = [greenTopTexture, icyTopTexture, pinkTopTexture, yellowTopTexture]
        
        // Config Duffy
            // Callback SKSpriteNode Image
        duffy = SKSpriteNode(imageNamed: "Idle/frame-1.png")
            // Set Position
        duffy.position = CGPoint(x: CGRectGetMidX(self.frame) / 2, y: CGRectGetMidY(self.frame))
        duffy.zPosition = 100
            // Set Size
        duffy.setScale(0.05)
            // Iterate to rename images
        var idleTextures:Array<SKTexture> = []
        for var i = 1; i <= 10; i++
        {
            idleTextures.append(SKTexture(imageNamed: "Idle/frame-\(i).png"))
        }
            // Animate Idle textures
        var duffyTextureAnimation = SKAction.animateWithTextures(idleTextures, timePerFrame: 0.1)
        var repeatDuffyTextureAnimation = SKAction.repeatActionForever(duffyTextureAnimation)
        duffy.runAction(repeatDuffyTextureAnimation)
            // Set Physics
        duffy.physicsBody = SKPhysicsBody(rectangleOfSize: duffy.size)
        duffy.physicsBody?.dynamic = true
        duffy.physicsBody?.allowsRotation = false
        
        // Add Child
        self.addChild(duffy)
        
        // Creating & Setting the spead of the BGs
        parallaxBG(1) // Set speed of the foreground and it will auto increment further background
        
        // Adding the non-random obstacles with a timer
        var obstaclesTimer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: Selector("makeObstacles"), userInfo: nil, repeats: true)
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        // Set touches for Duffy's Movement
        duffy.physicsBody?.velocity = CGVectorMake(0, 0)
        duffy.physicsBody?.applyImpulse(CGVectorMake(0, duffy.size.height)) // Set Jump sensibility
        println("Flappy is flying")
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    
    func parallaxBG(bgSpeed:CGFloat) {
        
        // Config Background
        // Set BG Textures
        var bg0 = SKSpriteNode(texture: SKTexture(imageNamed: "bg/bg-0.png"))
        bg0.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        bg0.size.height = self.frame.height
        var bg1 = SKSpriteNode(texture: SKTexture(imageNamed: "bg/bg-1.png"))
        bg1.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        bg1.size.height = self.frame.height
        var bg2 = SKSpriteNode(texture: SKTexture(imageNamed: "bg/bg-2.png"))
        bg2.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        bg2.size.height = self.frame.height
        var bg3 = SKSpriteNode(texture: SKTexture(imageNamed: "bg/bg-3.png"))
        bg3.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        bg3.size.height = self.frame.height
        var bg4 = SKSpriteNode(texture: SKTexture(imageNamed: "bg/bg-4.png"))
        bg4.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        bg4.size.height = self.frame.height
        // Set Core BG Animation
        var moveBG = SKAction.moveByX(-bg0.size.width, y: 0, duration: 10)
        var replaceBG = SKAction.moveByX(bg0.size.width, y: 0, duration: 0)
        var moveBGForever = SKAction.repeatActionForever(SKAction.sequence([moveBG, replaceBG]))
        for var i:CGFloat = 0; i < 3; i++ {
            
            // Set Cloned BGs
            bg0 = SKSpriteNode(texture: SKTexture(imageNamed: "bg/bg-0.png"))
            bg0.position = CGPoint(x: bg0.size.width / 2 + bg0.size.width * i, y:CGRectGetMidY(self.frame))
            bg0.size.height = self.frame.height
            bg1 = SKSpriteNode(texture: SKTexture(imageNamed: "bg/bg-1.png"))
            bg1.position = bg0.position
            bg1.size.height = self.frame.height
            bg2 = SKSpriteNode(texture: SKTexture(imageNamed: "bg/bg-2.png"))
            bg2.position = bg0.position
            bg2.size.height = self.frame.height
            bg3 = SKSpriteNode(texture: SKTexture(imageNamed: "bg/bg-3.png"))
            bg3.position = bg0.position
            bg3.size.height = self.frame.height
            bg4 = SKSpriteNode(texture: SKTexture(imageNamed: "bg/bg-4.png"))
            bg4.position = bg0.position
            bg4.size.height = self.frame.height
            
            // Run BGs Animations
            bg0.runAction(moveBGForever)
            bg1.runAction(moveBGForever)
            bg2.runAction(moveBGForever)
            bg3.runAction(moveBGForever)
            bg4.runAction(moveBGForever)
            
            // Set BGs Actions speed
            var theBgSpeed = bgSpeed
            bg4.speed = theBgSpeed
            bg3.speed = theBgSpeed / 1.35
            bg2.speed = theBgSpeed / 2
            bg1.speed = theBgSpeed / 2.8
            bg0.speed = theBgSpeed / 3
            
//            println("bg0speed:\(bg0.speed), bg1speed:\(bg1.speed), bg2speed:\(bg2.speed), bg3speed:\(bg3.speed), bg4speed:\(bg4.speed)")
            
            // Add bgs to scene
            self.addChild(bg0)
            self.addChild(bg1)
            self.addChild(bg2)
            self.addChild(bg3)
            self.addChild(bg4)
        }
        
    }
    
    func makeObstacles() {
        
        // Set Gap Size
        var gap = duffy.size.height * 3
        
        // Movement Amount
        var movementAmount = arc4random() % UInt32(self.frame.size.height / 2)
        
        // Obstacle Offset
        var obstacleOffset = CGFloat(movementAmount) - self.frame.size.height / 4
        
        // Move Obstacles
        var moveObstacles = SKAction.moveByX(-self.frame.size.width * 2, y: 0, duration: NSTimeInterval(self.frame.size.width / 100))
        
        // Removing a Obstacles
        var removeObstacles = SKAction.removeFromParent()
        
        // Move & Remove Obstacles
        var moveAndRemoveObstacles = SKAction.sequence([moveObstacles, removeObstacles])
        
//        var randomIndex1 = 0
        var randomIndex1 = Int(arc4random()) % bottomObstacles.count
        
        // Set Bottom Obstacle
        var bottomObstacle = SKSpriteNode(texture: bottomObstacles[randomIndex1])
        bottomObstacle.setScale(0.07)
        bottomObstacle.position = CGPoint(x: CGRectGetMidX(frame) + frame.size.width, y: CGRectGetMidY(frame) - bottomObstacle.size.height / 2 - gap / 2 + obstacleOffset)
        bottomObstacle.zPosition = 80
        bottomObstacle.physicsBody = SKPhysicsBody(rectangleOfSize: bottomObstacle.size)
        bottomObstacle.physicsBody?.dynamic = false
        bottomObstacle.runAction(moveAndRemoveObstacles)
        // Set Top Obstacle
        var topObstacle = SKSpriteNode(texture: topObstacles[randomIndex1])
        topObstacle.setScale(0.07)
        topObstacle.position = CGPoint(x: CGRectGetMidX(frame) + frame.size.width, y: CGRectGetMidY(frame) + topObstacle.size.height / 2 + gap / 2 + obstacleOffset)
        topObstacle.zPosition = 80
        topObstacle.physicsBody = SKPhysicsBody(rectangleOfSize: topObstacle.size)
        topObstacle.physicsBody?.dynamic = false
        topObstacle.runAction(moveAndRemoveObstacles)

        // Add Obstacles to Scene
        self.addChild(bottomObstacle)
        self.addChild(topObstacle)
    }
}


