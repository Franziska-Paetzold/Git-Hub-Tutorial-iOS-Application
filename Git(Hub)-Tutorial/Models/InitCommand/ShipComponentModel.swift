//
//  ShipComponentModel.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 27.08.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class ShipComponentModel: SKSpriteNode {
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(textureName: String, position: CGPoint) {
        let shipComponentTexture = SKTexture(imageNamed: textureName)
        self.init(texture: shipComponentTexture, color: .black, size: CGSize(width: shipComponentTexture.size().width, height: shipComponentTexture.size().height))
        self.alpha = 0.4
        self.anchorPoint = CGPoint(x:0.5, y: 0.5)
        //ToDo größe nicht mehr abhängig von view
        self.position = position
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
