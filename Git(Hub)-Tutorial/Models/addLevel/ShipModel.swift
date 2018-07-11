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
    
    //textures (for physicsbodies)
    let shipTexture = SKTexture(imageNamed: "ship")
    
     self = SKSpriteNode(texture: shipTexture)
    shipNode.name = "SHIP"
    /*
     //anchor ist on the bottom right of the picture
     shipNode.anchorPoint = CGPoint(x:1.0, y: 0.0)
     shipNode.position = CGPoint(x: (size.width/10)*9.9, y: (size.height/10)*0.1)
     print("full width: \(size.width)")
     print("curr width: \((size.width/10)*9.9)")
     print("full height: \(size.height)")
     print("curr height: \((size.height/10)*0.1)")
     */
    
    shipNode.position = CGPoint(x: (size.width/3)*2, y: (size.height/3)*1)
    
    shipNode.physicsBody = SKPhysicsBody(texture: shipTexture, size: CGSize(width: shipNode.size.width, height: shipNode.size.height))
    
    shipNode.physicsBody?.isDynamic = true //no gravity
    shipNode.physicsBody?.affectedByGravity = false
    
    
    shipNode.physicsBody?.categoryBitMask = collisionCategoryShip
    shipNode.physicsBody?.collisionBitMask = 0

}
