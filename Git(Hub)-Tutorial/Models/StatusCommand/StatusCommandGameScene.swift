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
    
    var paperNode = SKSpriteNode(imageNamed: "coiledList")
    var nextButtonNode = ButtonModel()
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
        
        //configuration of paperNode
        paperNodeCoiled()
        
       
        //============ initialization and configuration paper============
        foregroundNode.addChild(paperNode)
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {

            let touchPosition = touch.location(in: self)
            let touchedNode = self.atPoint(touchPosition)
            
            if  touchedNode == paperNode{
                paperOpen = true
            }
            
            /*
            if  touchedNode == nextButtonNode {
                myDelegate?.didFinishTask(sender: self)
            }
            */
            if nextButtonNode.touchesEnded(touches: touches, scene: self) {
                myDelegate?.didFinishTask(sender: self)
            }
            
            if (paperOpen){
                paperNodeRolledOut()
            }
        }
    }
    
    func paperNodeCoiled(){
        
        paperNode.size = CGSize(width: size.width/5*4, height: size.height/5*2)
        paperNode.position = CGPoint(x: size.width/2, y: size.height/2)
        
    }
    
    func paperNodeRolledOut(){
        //modify paperNode
        paperNode.texture = SKTexture(imageNamed: "rolledOutList")
        paperNode.size = CGSize(width: size.width/5*4, height: size.height/5*3)
        
        //add text to the paper
        let textNode = SKLabelNode(text: "modified: bridge/shoes.png \n \n modified: bridge/food.txt ")
        textNode.numberOfLines = 2
        textNode.fontColor = .black
        textNode.fontSize = 20
        paperNode.addChild(textNode)
        
        //display Button
        nextButtonNode = ButtonModel(position: CGPoint(x: size.width/2, y: size.height/5*0.5), text: "weiter")
        addChild(nextButtonNode)
    }
    
    
}
