//
//  CommandGameModel.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 25.06.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class CommandGameModel: SKScene, SKPhysicsContactDelegate {
    
    //textures (for physicsbodies)
    let shipTexture = SKTexture(imageNamed: "ship")
    let cargoTexture = SKTexture(imageNamed: "cargo")
    
    //nodes
    let backgroundNode = SKSpriteNode(imageNamed: "background")
    let foregroundNode = SKSpriteNode()
    
    var shippingItems: [SKNode] = []
    
    let collisionCategoryCargo: UInt32 = 0x1 << 1
    let collisionCategoryShip: UInt32 = 0x1 << 2
    
    var touchedNode = SKSpriteNode()
    
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    
    override init(size: CGSize){
        super.init(size: size)
        self.physicsWorld.contactDelegate = self
        //physicsWorld.contactDelegate = self
        
        //ability for user to apply an impulse to the nodes
        isUserInteractionEnabled = true
        
        
        //============configuration background==============
        backgroundNode.size.width = frame.size.width //sets the Node to the views frame
        
        //position is a point in the view and anchorPoint is the a relative point in the picture that adjusts to the position point
        backgroundNode.anchorPoint = CGPoint(x: 0.5, y: 0.0) //on which point the node is set (0.5 & 0 is bottom center of the node)
        backgroundNode.position = CGPoint (x: size.width / 2.0, y: 0.0) //set node to the middle and the bottom of the scene
        addChild(backgroundNode) // adds node to scene
        
        //============add foreground==============
        addChild(foregroundNode)
        
        //============initialization and configuration cargo============
        let cargoNode = SKSpriteNode(imageNamed: "cargo")
        cargoNode.name = "CARGO"
        cargoNode.physicsBody = SKPhysicsBody(texture: cargoTexture, size: CGSize(width: cargoNode.size.width, height: cargoNode.size.height))
        cargoNode.physicsBody?.isDynamic = true //false, because the package shouldnt fall out of the screen
        cargoNode.physicsBody?.affectedByGravity = false
        cargoNode.position = CGPoint(x: size.width/2.0, y: size.height/10*9) // anchorPoint is the middle
        //stop rotation by collision
        cargoNode.physicsBody?.allowsRotation = false
        
        cargoNode.physicsBody?.categoryBitMask = collisionCategoryCargo
        cargoNode.physicsBody?.contactTestBitMask = collisionCategoryShip
        cargoNode.physicsBody?.collisionBitMask = 0 //handling collision on my own
        foregroundNode.addChild(cargoNode)
        shippingItems.append(cargoNode)
        
        //============ initialization and configuration ship============
        let shipNode = SKSpriteNode(texture: shipTexture)
        shipNode.name = "SHIP"
        /*
        //anchor ist on the bottom right of the picture
        shipNode.anchorPoint = CGPoint(x:1.0, y: 0.0)
        shipNode.position = CGPoint(x: (size.width/10)*9.9, y: (size.height/10)*0.1)
        print("full width: \(size.width)")
        print("curr width: \((size.width/10)*9.9)")
        print("full height: \(size.height)")
        print("curr height: \((size.height/10)*0.1)")
         */
        
        shipNode.position = CGPoint(x: (size.width/3)*2, y: (size.height/3)*1)
        
        shipNode.physicsBody = SKPhysicsBody(texture: shipTexture, size: CGSize(width: shipNode.size.width, height: shipNode.size.height))
        
        shipNode.physicsBody?.isDynamic = true //no gravity
        shipNode.physicsBody?.affectedByGravity = false
        
            
        shipNode.physicsBody?.categoryBitMask = collisionCategoryShip
        shipNode.physicsBody?.collisionBitMask = 0
        
        foregroundNode.addChild(shipNode)
    }
    
    
    //needs isUserInteractionEnabled = true in initializer
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
    
    func didBegin(_ contact: SKPhysicsContact) {
        print ("contact begin")
        //a: represents first body in the contact (cargo) alias the selected node, b: property represents second body
        let selectedNode = contact.bodyA.node!
        let contactNode = contact.bodyB.node!
        
        if contactNode.name == "SHIP" {
            selectedNode.removeFromParent()
            print("removed cargo")
            
            //TODO: add message on screen "Super, Schiff ist voll beladen!"
            //ToDO: Trigger for segue to the next screen
    }
    //remove package node if it contacts the ship
    func didEnd(_ contact: SKPhysicsContact) {
        print("contact end")
        
        
        }
}


}




