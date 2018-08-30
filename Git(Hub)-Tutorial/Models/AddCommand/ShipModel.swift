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
    
    convenience init(position: CGPoint, physicsBodyEnabled: Bool) {
        let shipTexture = SKTexture(imageNamed: "ship")
        self.init(texture: shipTexture, color: .black, size: CGSize(width: shipTexture.size().width, height: shipTexture.size().height))
        self.name = "SHIP"
        
        if physicsBodyEnabled == true{
            self.anchorPoint = CGPoint(x:0.5, y: 0.19)
            let hullTexture = SKTexture(imageNamed: "shipHull")
                self.physicsBody = SKPhysicsBody(texture: hullTexture, size: hullTexture.size())
                
                self.physicsBody?.isDynamic = true //no gravity
                self.physicsBody?.affectedByGravity = false
                
                self.physicsBody?.categoryBitMask = collisionCategory
                self.physicsBody?.collisionBitMask = 0
        }
        
        self.position = position
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
