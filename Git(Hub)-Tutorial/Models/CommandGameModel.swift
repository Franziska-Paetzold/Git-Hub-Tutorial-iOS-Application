//
//  CommandGameModel.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 25.06.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit
import CoreMotion

class CommandGameModel: SKScene {
    
    let backgroundNode = SKSpriteNode(imageNamed: "background")
    let foregroundNode = SKSpriteNode()
    let cargoNode = SKSpriteNode(imageNamed: "cargo")
    let shipNode = SKSpriteNode(imageNamed: "ship")
    let collisionCategoryCargo: UInt32 = 0x1 << 1
    let collisionCategoryShip: UInt32 = 0x1 << 2
    
    //get acess to iOS motion services
    let coreMotionManager = CMMotionManager()
    
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    
    override init(size: CGSize){
        super.init(size: size)
        // needed for extension
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -0.1) //TODO: dy: 5.0
        
        //ability for user to apply an impulse
        isUserInteractionEnabled = true
        
        
        //============configuration background==============
        backgroundNode.size.width = frame.size.width //sets the Node to the views frame
        
        //position is a point in the view and anchorPoint is the a relative point in the picture that adjusts to the position point
        backgroundNode.anchorPoint = CGPoint(x: 0.5, y: 0.0) //on which point the node is set (0.5 & 0 is bottom center of the node)
        backgroundNode.position = CGPoint (x: size.width / 2.0, y: 0.0) //set node to the middle and the bottom of the scene
        addChild(backgroundNode) // adds node to scene
        //============add foreground==============
        addChild(foregroundNode)
        
        //============configuration cargo============
        cargoNode.physicsBody = SKPhysicsBody (rectangleOf: CGSize(width: cargoNode.size.width, height: cargoNode.size.height))
        cargoNode.physicsBody?.isDynamic = false //false, because the package shouldnt fall out of the screen
        cargoNode.position = CGPoint(x: size.width/2.0, y: 180.0) // anchorPoint is the middle
        //stop rotation by collision
        cargoNode.physicsBody?.allowsRotation = false
        
        cargoNode.physicsBody?.categoryBitMask = collisionCategoryCargo
        cargoNode.physicsBody?.contactTestBitMask = collisionCategoryShip
        cargoNode.physicsBody?.collisionBitMask = 0 //handling collision on our own
        foregroundNode.addChild(cargoNode)
        
        //============configuration ship============
        shipNode.name = "SHIP"
        shipNode.position = CGPoint(x: cargoNode.position.x + 20, y: cargoNode.position.y)
        shipNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: shipNode.size.width, height: shipNode.size.height))
        shipNode.physicsBody?.isDynamic = false //no gravity
            
        shipNode.physicsBody?.categoryBitMask = collisionCategoryShip
        shipNode.physicsBody?.collisionBitMask = 0
        
        foregroundNode.addChild(shipNode)
    }
    
    
    //needs isUserInteractionEnabled = true in initializer
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !cargoNode.physicsBody!.isDynamic {
            cargoNode.physicsBody?.isDynamic = true
            
            coreMotionManager.accelerometerUpdateInterval = 0.3 //3/10th of a second
            coreMotionManager.startAccelerometerUpdates()
        }
    }
    
    //changes the position of the background based on the position of the player
    override func update(_ currentTime: TimeInterval) {
        backgroundNode.position = CGPoint(x: backgroundNode.position.x, y: -((cargoNode.position.y - 180.0)/8))
    }
    //TODO player can still leave the view
    
    override func didSimulatePhysics(){
        if let accelerometerData = coreMotionManager.accelerometerData {
            cargoNode.physicsBody!.velocity = CGVector(dx: CGFloat(accelerometerData.acceleration.x * 360), dy: cargoNode.physicsBody!.velocity.dy)
        }
        
        /*
        if playerNode.position.x < -(playerNode.size.width/2){
            playerNode.position = CGPoint(x: size.width - playerNode.size.width / 2, y: playerNode.position.y)
        }
        else if playerNode.position.x > self.size.width {
            playerNode.position = CGPoint(x: playerNode.size.width / 2, y: playerNode.position.y)
        }
         */
    }
    
    deinit {
        coreMotionManager.stopAccelerometerUpdates()
    }
}

//remove package node if it contacts the ship
extension CommandGameModel: SKPhysicsContactDelegate{
    func didBegin(_ contact: SKPhysicsContact) {
        //a represents first body in the contact (cargo), b property represents second body
        let contactNode = contact.bodyA.node!
        
        if contactNode.name == "SHIP" {
            contactNode.removeFromParent()
            //TODO: add message on screen "Super, Schiff ist voll beladen!"
            //ToDO: Trigger for segue to the next screen
        }
    }
}




