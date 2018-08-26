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
    
    var commandGameScene: CommandGameScene!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //main view
        let commandGameView = view as! SKView
        commandGameView.showsFPS = false
        
        //game "scene"
        commandGameScene = CommandGameScene(size: commandGameView.bounds.size)
        commandGameScene.scaleMode = .aspectFill //over the full screen
        
        commandGameScene.myDelegate = self
        
        //show scene
        commandGameView.showsPhysics = true
        commandGameView.presentScene(commandGameScene)
        
    }
    
    func nextView(){
        if commandGameScene.levelDoneFlag {
            print("rechead view changing point")
            self.performSegue(withIdentifier: "segueCommandGameToCommandFeedback", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CommandFeedbackViewController{        destination.segueFromController = "CommandGameViewController"
        }
    }
    
}

extension CommandGameViewController: SceneDelegate{
    func didFinishTask(sender: SKScene) {
        print("mini game done")
        self.performSegue(withIdentifier: "segueCommandGametoCommandFeedback", sender: nil)
    }
}

