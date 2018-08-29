//
//  CommitCommandGameScene.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 28.08.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class CommitCommandGameScene: CommandGameSceneModel {
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    private override init(size: CGSize) {
        super.init(size: size)
    }
    
    convenience init(newSize: CGSize){
        self.init(size: newSize)
        //for command identification
        self.name = "commit"
        
        //============ initialization and configuration ship============
        //ship from shipModel
        let shipNode = ShipModel(position: CGPoint(x: (size.width/2), y: (size.height/5)*2.75), physicsBodyEnabled: false)
        foregroundNode.addChild(shipNode)
        
    }
    
    //any event func
    // myDelegate?.didFinishTask(sender: self)
    
    
    
    
}
