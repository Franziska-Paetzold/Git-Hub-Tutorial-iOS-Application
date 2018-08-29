//
//  AddCommandGameScene.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 25.06.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class AddCommandGameScene: CommandGameSceneModel, SKPhysicsContactDelegate {
    
    //textures (for physicsbodies)
    let cargoTexture = SKTexture(imageNamed: "cargo")
    
    //collects the cargoNodes
    var shippingItems: [SKNode] = []
    
    //selected node by users touch
    var touchedNode = SKSpriteNode()
    
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    private override init(size: CGSize) {
        super.init(size: size)
    }
    
    convenience init(newSize: CGSize){
        self.init(size: newSize)
        self.physicsWorld.contactDelegate = self
        //physicsWorld.contactDelegate = self
        
        //for command identification
        self.name = "add"
        
        //============ initialization and configuration ship============
        //ship from shipModel
        let shipNode = ShipModel(position: CGPoint(x: (size.width/5)*5, y: (size.height/5)*0), physicsBodyEnabled: true)
        foregroundNode.addChild(shipNode)
        
        //============initialization and configuration cargo============
        let cargoNode = CargoModel(contactTestBitMask: shipNode.collisionCategory)
        foregroundNode.addChild(cargoNode)
        shippingItems.append(cargoNode)
    }
    
    
    //needs isUserInteractionEnabled = true in initializer
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            myDelegate?.didFinishTask(sender: self)
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
            if let itemIndex = shippingItems.index(of: selectedNode){
                shippingItems.remove(at: itemIndex)
            }
        }
        
        if shippingItems.isEmpty{
            print("ship is fully loaded")
            myDelegate?.didFinishTask(sender: self)
        }
        
        
        //TODO: add message on screen "Super, Schiff ist voll beladen!"
        //ToDO: Trigger for segue to the next screen
    }
    
    //remove package node if it contacts the ship
    func didEnd(_ contact: SKPhysicsContact) {
        print("contact end")
        
        }

}


