//
//  ButtonModel.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 27.08.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class ButtonModel: SKSpriteNode {
    
    
    var label = SKLabelNode()
    
    //required,  properties not used
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init( position: CGPoint, text: String) {
        //placeholder content for required properties
        let buttonTexture = SKTexture(imageNamed: "placeholder150x50")
        self.init(texture: buttonTexture, color: .black, size: CGSize(width: buttonTexture.size().width, height: buttonTexture.size().height))
        
        //used content
        self.color = .red
        self.size = CGSize(width: 100, height: 44)
        // self.position = CGPoint(x: size.width/2, y: size.heigth/2)
        self.position = position
        
        self.label.text = text
        self.label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        self.label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        self.label.fontColor = .black
        addChild(self.label)
        
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func touchesEnded(touches: Set<UITouch>, scene: SKScene!) -> Bool{
        for touch in touches {
            // Get the location of the touch in this scene
            let location = touch.location(in: scene)
            // Check if the location of the touch is within the button's bounds
            if self.contains(location) {
                print("TAAAAAAAAAAAAAAAAAAAAAAAAAapped!")
                return true
            }
            else{
                return false
            }
        }
        return false
    }
}
