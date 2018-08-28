//
//  AddCommandGameScene.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 25.06.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class AddCommandGameScene: SKScene, SKPhysicsContactDelegate {
    
    
    weak var myDelegate: CommandGameViewController?
    
    //textures (for physicsbodies)
    let cargoTexture = SKTexture(imageNamed: "cargo")
    
    //parent nodes for the other nodes of the skviw
    let backgroundNode = SKSpriteNode(imageNamed: "background")
    let foregroundNode = SKSpriteNode()

    //collects the cargoNodes
    var shippingItems: [SKNode] = []
    
    //selected node by users touch
    var touchedNode = SKSpriteNode()
    
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    
    override init(size: CGSize){
        super.init(size: size)
        self.physicsWorld.contactDelegate = self
        //physicsWorld.contactDelegate = self
        
        //for command identification
        self.name = "add"
        self.scaleMode = .aspectFill
        
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
        
        //============ initialization and configuration ship============
        //ship from shipModel
        let shipNode = ShipNode(viewWidth: size.width, viewHeight: size.height)
        foregroundNode.addChild(shipNode)
        
        //============initialization and configuration cargo============
        let cargoNode = CargoNode(contactTestBitMask: shipNode.collisionCategory)
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



