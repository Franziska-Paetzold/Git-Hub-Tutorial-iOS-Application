//
//  InitCommandGameScene.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 27.08.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class InitCommandGameScene: SKScene , SKPhysicsContactDelegate {
    
    
    weak var myDelegate: CommandGameViewController?
    
    //textures (for physicsbodies)
    let shipComponentI = SKTexture(imageNamed: "cargo")
    
    //parent nodes for the other nodes of the skviw
    let backgroundNode = SKSpriteNode(imageNamed: "background")
    let foregroundNode = SKSpriteNode()
    
    //collects the components of the ship
    var shipComponents : [SKSpriteNode] = []
    
    var button = ButtonModel()
    
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    
    override init(size: CGSize){
        super.init(size: size)
        
        //for command identification
        self.name = "init"
        
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
        
        
        //============ initialization and configuration ship components============
        //shipComponent from shipComponentModel
        let shipComponentINode = ShipComponentModel(textureName: "shipComponentI", position: CGPoint(x: size.width/2, y: (size.height/5)*1.5))
        foregroundNode.addChild(shipComponentINode)
        shipComponents.append(shipComponentINode)
        
        let shipComponentIINode = ShipComponentModel(textureName: "shipComponentII", position: CGPoint(x: (size.width/5)*2, y: (size.height/5)*2.925))
        foregroundNode.addChild(shipComponentIINode)
        shipComponents.append(shipComponentIINode)
        
        let shipComponentIIINode = ShipComponentModel(textureName: "shipComponentIII", position: CGPoint(x: (size.width/5)*3, y: (size.height/5)*3.5))
        foregroundNode.addChild(shipComponentIIINode)
        shipComponents.append(shipComponentIIINode)
        
        //============ initialization and configuration button============
        //button from buttonModel
        button = ButtonModel(position: CGPoint(x: size.width/2, y: (size.height/5)*0.5), text: "Bauen!")
        foregroundNode.addChild(button)
    }
    

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (button.touchesEnded(touches: touches, scene: self)){
            shipComponents[0].alpha = 1
            shipComponents.remove(at: 0)
        }
        
        if shipComponents.isEmpty{
            print("ship is fully build")
            myDelegate?.didFinishTask(sender: self)
        }
    }
    
    
    
}




