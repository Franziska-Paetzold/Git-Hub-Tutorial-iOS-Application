//
//  ShipNode.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 11.07.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class ShipNode: SKSpriteNode {
    
    let collisionCategory: UInt32 = 0x1 << 2
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(viewWidth: CGFloat, viewHeight: CGFloat) {
        let shipTexture = SKTexture(imageNamed: "ship")
        self.init(texture: shipTexture, color: .black, size: CGSize(width: shipTexture.size().width, height: shipTexture.size().height))
        self.name = "SHIP"
        self.anchorPoint = CGPoint(x:1.0, y: 0.0)
        //ToDo größe nicht mehr abhängig von view
        self.position = CGPoint(x: (viewWidth/3)*2, y: (viewHeight/3)*1)
        
       if let _shipTexture = self.texture{
        
        self.physicsBody = SKPhysicsBody(texture: _shipTexture, size: CGSize(width: self.size.width, height: self.size.height))
        
        
        self.physicsBody?.isDynamic = true //no gravity
        self.physicsBody?.affectedByGravity = false
        
        self.physicsBody?.categoryBitMask = collisionCategory
        self.physicsBody?.collisionBitMask = 0
           
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
