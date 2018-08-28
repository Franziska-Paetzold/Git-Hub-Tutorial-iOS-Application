//
//  CommitCommandGameScene.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 28.08.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class CommitCommandGameScene: SKScene {
    
    weak var myDelegate: CommandGameViewController?
    
    //parent nodes for the other nodes of the skviw
    let backgroundNode = SKSpriteNode(imageNamed: "background")
    let foregroundNode = SKSpriteNode()

    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    
    override init(size: CGSize){
        super.init(size: size)
        
        //for command identification
        self.name = "commit"
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
        let shipNode = ShipModel(position: CGPoint(x: (size.width/2), y: (size.height/5)*2.75), physicsBodyEnabled: false)
        foregroundNode.addChild(shipNode)
        
    }
    
    //any event func
    // myDelegate?.didFinishTask(sender: self)
    
    
    
    
}
