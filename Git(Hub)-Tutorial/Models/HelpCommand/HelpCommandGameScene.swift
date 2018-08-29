//
//  HelpCommandGameScene.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 29.08.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit

class HelpCommandGameScene: CommandGameSceneModel {
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    private override init(size: CGSize) {
        super.init(size: size)
    }
    
    convenience init(newSize: CGSize){
        self.init(size: newSize)
        //for command identification
        self.name = "commit"
    }
    
}
