//
//  InitCommandGameScene.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 27.08.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class InitCommandGameScene: CommandGameSceneModel {
    //collects the components of the ship
    var shipComponents : [SKSpriteNode] = []
    
    var button = ButtonModel()
    
   private override init(size: CGSize) {
        super.init(size: size)
    }
    
    convenience init(newSize: CGSize){
        self.init(size: newSize)
        
        //for command identification
        self.name = "init"
        
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (checkGameState()){
            //this order of queries prevents system crash by too many too fast button taps
        }
        else if (button.touchesEnded(touches: touches, scene: self)){
            shipComponents[0].alpha = 1
            shipComponents.remove(at: 0)
            checkGameState()
        }
    }
    
    func checkGameState() -> Bool {
        if shipComponents.isEmpty{
            print("ship is fully build")
            myDelegate?.didFinishTask(sender: self)
            return true
        }
        return false
    }
    
}




