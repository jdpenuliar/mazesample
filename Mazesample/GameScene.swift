//
//  GameScene.swift
//  Mazesample
//
//  Created by JD Penuliar on 7/9/16.
//  Copyright (c) 2016 JD Penuliar. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    //manage of all motion
    let manager = CMMotionManager()
    var player = SKSpriteNode()
    var endNode = SKSpriteNode()
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        
        self.physicsWorld.contactDelegate = self
        
        player = self.childNode(withName: "player") as! SKSpriteNode
        endNode = self.childNode(withName: "endNode") as! SKSpriteNode
        
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdates(to: OperationQueue.main){
            (data, error) in
            self.physicsWorld.gravity = CGVector(dx: CGFloat((data?.acceleration.x)!) * 10, dy: CGFloat((data?.acceleration.y)!) * 10)
            print (data, self.physicsWorld.gravity)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        if (bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2) || (bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1){
            print ("haha")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            
        }
    }
   
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
