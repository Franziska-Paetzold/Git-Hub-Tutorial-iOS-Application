//
//  StatusCommandGameScene.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 28.08.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class StatusCommandGameScene: CommandGameSceneModel {
    var paperNode = SKSpriteNode(imageNamed: "placeholder150x50")
    var paperOpen = false
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    private override init(size: CGSize) {
        super.init(size: size)
    }
    
    convenience init(newSize: CGSize){
        self.init(size: newSize)
        
        //for command identification
        self.name = "status"
        
        //============ initialization and configuration paper============
        foregroundNode.addChild(paperNode)
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {

            let touchPosition = touch.location(in: self)
            let touchedNode = self.atPoint(touchPosition)
            
            if paperNode == touchedNode {
                paperOpen = true
            }
            
            if (paperOpen){
                //paperNode.image wescheln
                print("paper open")
                myDelegate?.didFinishTask(sender: self)
            }
        }
    }
    
    
}
