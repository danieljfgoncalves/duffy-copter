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
    var duffy = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        // Config Scene Boundaries
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)

        // Config Duffy
            // Callback SKSpriteNode Image
        duffy = SKSpriteNode(imageNamed: "Idle/frame-1.png")
            // Set Position
        duffy.position = CGPoint(x: CGRectGetMidX(self.frame) / 2, y: CGRectGetMidY(self.frame))
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
            
            bg0.runAction(moveBGForever)
            bg0.speed = 0.25
            bg1.runAction(moveBGForever)
            bg1.speed = 1
            bg2.runAction(moveBGForever)
            bg2.speed = 2
            bg3.runAction(moveBGForever)
            bg3.speed = 3
            bg4.runAction(moveBGForever)
            bg4.speed = 3.5
            self.addChild(bg0)
            self.addChild(bg1)
            self.addChild(bg2)
            self.addChild(bg3)
            self.addChild(bg4)
            
            func makeObstacles()
            
        }
        
        // Add Child
        self.addChild(duffy)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        // Set touches for Duffy's Movement
        duffy.physicsBody?.velocity = CGVectorMake(0, 0)
        duffy.physicsBody?.applyImpulse(CGVectorMake(0, 60))
        println("Flappy is flying")
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
