//
//  CommandGameModel.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 25.06.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class CommandGameModel: SKScene {
    
    let backgroundNode = SKSpriteNode(imageNamed: "background")
    let foregroundNode = SKSpriteNode()
    
    let shipNode = SKSpriteNode(imageNamed: "ship")
    let cargoNode = SKSpriteNode(imageNamed: "cargo")
    var shippingItems: [SKNode] = []
    
    let collisionCategoryCargo: UInt32 = 0x1 << 1
    let collisionCategoryShip: UInt32 = 0x1 << 2
    
    var touchedNode = SKSpriteNode()
    
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    
    override init(size: CGSize){
        super.init(size: size)
        // needed for extension
        physicsWorld.contactDelegate = self
        
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
        cargoNode.name = "CARGO"
        cargoNode.physicsBody?.isDynamic = false //false, because the package shouldnt fall out of the screen
        cargoNode.position = CGPoint(x: size.width/2.0, y: size.height/10*9) // anchorPoint is the middle
        //stop rotation by collision
        cargoNode.physicsBody?.allowsRotation = false
        
        cargoNode.physicsBody?.categoryBitMask = collisionCategoryCargo
        cargoNode.physicsBody?.contactTestBitMask = collisionCategoryShip
        cargoNode.physicsBody?.collisionBitMask = 0 //handling collision on our own
        foregroundNode.addChild(cargoNode)
        shippingItems.append(cargoNode)
        
        //============configuration ship============
        shipNode.name = "SHIP"
        shipNode.anchorPoint = CGPoint(x:1.0, y: 0.0) //anchor ist on the bottom right of the picture
        shipNode.position = CGPoint(x: (size.width/10)*9.9, y: (size.height/10)*0.1)
        print("full width: \(size.width)")
        print("curr width: \((size.width/10)*9.9)")
        print("full height: \(size.height)")
        print("curr height: \((size.height/10)*0.1)")
        shipNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: shipNode.size.width, height: shipNode.size.height))
        shipNode.physicsBody?.isDynamic = false //no gravity
            
        shipNode.physicsBody?.categoryBitMask = collisionCategoryShip
        shipNode.physicsBody?.collisionBitMask = 0
        
        foregroundNode.addChild(shipNode)
    }
    
    
    //needs isUserInteractionEnabled = true in initializer
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchPosition = touch.location(in: self)
            let touchedNode = self.atPoint(touchPosition)
        
            if shippingItems.contains(touchedNode) {
                touchedNode.position.x = touchPosition.x
                touchedNode.position.y = touchPosition.y
            }
            
        }
    }
    
}

//remove package node if it contacts the ship
extension CommandGameModel: SKPhysicsContactDelegate{
    func didBegin(_ contact: SKPhysicsContact) {
        print("contact")
        
        //a represents first body in the contact (cargo), b property represents second body
        let contactNode = contact.bodyA.node!
        
        if contactNode.name == "SHIP" {
            contactNode.removeFromParent()
            //TODO: add message on screen "Super, Schiff ist voll beladen!"
            //ToDO: Trigger for segue to the next screen
        }
    }
}




