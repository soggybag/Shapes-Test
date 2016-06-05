//
//  GameScene.swift
//  Shapes-Test
//
//  Created by mitchell hudson on 6/4/16.
//  Copyright (c) 2016 mitchell hudson. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        physicsBody = SKPhysicsBody(edgeLoopFromRect: view.frame)
        backgroundColor = SKColor.blackColor()
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
    }
    
    
    func didBeginContact(contact: SKPhysicsContact) {
        print(contact)
    }
    
    
    
    func makeStar() -> SKSpriteNode {
        let starImage = StarKit.imageOfStar
        let texture = SKTexture(image: starImage)
        let star = SKSpriteNode(texture: texture)
        
        star.physicsBody = SKPhysicsBody(polygonFromPath: StarKit.getStarPath().CGPath)
        
        
        return star
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        guard let touch = touches.first else {
            return
        }
        
        let star = makeStar()
        addChild(star)
        star.position = touch.locationInNode(self)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
