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
  
    var displayIsTouched = false
    var detectedNodeContact = false
    var contactNode: SKNode!
    var selectedNode: SKNode!
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
        //self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        //for command identification
        self.name = "add"
        
        //============ initialization and configuration ship============
        //ship from shipModel
        let shipNode = ShipModel(position: CGPoint(x: (size.width/5)*3, y: (size.height/5)*0.7), physicsBodyEnabled: true)
        foregroundNode.addChild(shipNode)
        
       
        
        //============initialization and configuration bridge============
        
        let bridgeNode = SKSpriteNode(imageNamed: "bridge")
        bridgeNode.size = CGSize(width: size.width/5*4, height: size.width/5*2)
            bridgeNode.position = CGPoint(x: size.width/5*2, y: size.height/10*8.5)
        foregroundNode.addChild(bridgeNode)
        
        //============initialization and configuration cargo============
        let cargoNode = CargoModel(contactTestBitMask: shipNode.collisionCategory, position: CGPoint(x: size.width/2, y: size.height/10*9))
        foregroundNode.addChild(cargoNode)
        shippingItems.append(cargoNode)
        
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if ((detectedNodeContact) && (displayIsTouched == false))
        {
            removeShippingItem()
            detectedNodeContact = false
        }
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        displayIsTouched = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        displayIsTouched = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        displayIsTouched = false
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print ("contact begin")
        //a: represents first body in the contact (ship) , b: property represents second body (cargo) alias the selected node
        contactNode = contact.bodyA.node!
        selectedNode = contact.bodyB.node!
        
        detectedNodeContact = true
      
        
    }
    
    func removeShippingItem(){
        if (contactNode.name == "SHIP") {
            selectedNode.removeFromParent()
            if let itemIndex = shippingItems.index(of: selectedNode){
                print("index II: \(itemIndex)")
                shippingItems.remove(at: itemIndex)
            }
        }
        
        if (shippingItems.isEmpty){
            print("ship is fully loaded")
            myDelegate?.didFinishTask(sender: self)
        }
        
    }
}



