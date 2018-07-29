//
//  CargoNode.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 11.07.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class CargoNode: SKSpriteNode {
    
    let collisionCategory: UInt32 = 0x1 << 1
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(contactTestBitMask: UInt32) {
        //let cargoTexture = SKTexture(imageNamed: "cargo")
        self.init(texture: SKTexture(imageNamed: "cargo"), color: .black, size: CGSize(width: 100, height: 100))
        self.name = "CARGO"
        
        //default anchor is in the middle
        self.position = CGPoint(x: size.width/2.0, y: size.height/10*9)
        if let cargoTexture = self.texture{
            self.physicsBody = SKPhysicsBody(texture: cargoTexture, size: CGSize(width: self.size.width, height: self.size.height))
            
            //false, because the package shouldnt fall out of the screen
            self.physicsBody?.isDynamic = false
            //no gravity
            self.physicsBody?.affectedByGravity = false
            //stop rotation by collision
            self.physicsBody?.allowsRotation = false
            self.physicsBody = SKPhysicsBody(texture: cargoTexture, size: CGSize(width: self.size.width, height: self.size.height))
            
            self.physicsBody?.categoryBitMask = collisionCategory
            self.physicsBody?.contactTestBitMask = contactTestBitMask
            //0 = handling collision on my own
            self.physicsBody?.collisionBitMask = 0
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
   }
