//
//  ShipModel.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 11.07.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class ShipModel: SKSpriteNode {
    
    let collisionCategory: UInt32 = 0x1 << 2
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        self.init(texture: SKTexture(imageNamed: "ship"), color: .black, size: CGSize(width: 100, height: 100))
        self.name = "SHIP"
        self.anchorPoint = CGPoint(x:1.0, y: 0.0)
        //ToDo größe nicht mehr abhängig von view
        self.position = CGPoint(x: (size.width/3)*2, y: (size.height/3)*1)
       if let shipTexture = self.texture{
        
        self.physicsBody = SKPhysicsBody(texture: shipTexture, size: CGSize(width: self.size.width, height: self.size.height))
        
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
