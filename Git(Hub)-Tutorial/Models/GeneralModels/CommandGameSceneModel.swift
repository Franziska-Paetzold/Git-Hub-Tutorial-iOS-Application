//
//  CommandGameSceneModel.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 28.08.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class CommandGameSceneModel: SKScene {
    
    weak var myDelegate: CommandGameViewController?
    
    var delay = false
    
    //parent nodes for the other nodes of the skviw
    let backgroundNode = SKSpriteNode(imageNamed: "background")
    let foregroundNode = SKSpriteNode()
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override  init(size: CGSize) {
        super.init(size: size)
        self.scaleMode = .aspectFill
        
        //ability for user to apply an impulse to the nodes
        isUserInteractionEnabled = true
        
        //============configuration background==============
        backgroundNode.size.width = frame.size.width //sets the Node to the views frame
        
        //position is a point in the view and anchorPoint is the a relative point in the picture that adjusts to the position point
        backgroundNode.anchorPoint = CGPoint(x: 0.5, y: 0.0) //on which point the node is set (0.5 & 0 is bottom center of the node)
        backgroundNode.position = CGPoint (x: size.width / 2.0, y: 0.0) //set node to the middle and the bottom of the scene
        super.addChild(backgroundNode) // adds node to scene
        
        //============add foreground==============
        super.addChild(foregroundNode)
    
    }
    
}
