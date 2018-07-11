//
//  CommandGameViewController.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 25.06.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class CommandGameViewController: UIViewController {
    
    var commandGameModel: CommandGameModel!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //main view
        let commandGameView = view as! SKView
        commandGameView.showsFPS = false
        
        //game "scene"
        commandGameModel = CommandGameModel(size: commandGameView.bounds.size)
        commandGameModel.scaleMode = .aspectFill //over the full screen
        
        //show scene
        commandGameView.showsPhysics = true
        commandGameView.presentScene(commandGameModel)
        
    }
    
    func nextView(){
        if commandGameModel.levelDoneFlag {
            print("rechead view changing point")
            self.performSegue(withIdentifier: "segueCommandGameToCommandFeedback", sender: nil)
        }
    }
   
}
