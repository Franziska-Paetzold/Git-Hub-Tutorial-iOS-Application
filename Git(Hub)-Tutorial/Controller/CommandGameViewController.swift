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
    
    
    
    var addCommandGameScene: AddCommandGameScene!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //main view
        let commandGameView = view as! SKView
        commandGameView.showsFPS = false
        
        //game scene"
        addCommandGameScene = AddCommandGameScene(size: commandGameView.bounds.size)
        addCommandGameScene.scaleMode = .aspectFill //over the full screen
        
        addCommandGameScene.myDelegate = self
        
        //show scene
        commandGameView.showsPhysics = false
        commandGameView.presentScene(addCommandGameScene)
        
    }
    
    func nextView(){
        if addCommandGameScene.levelDoneFlag {
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

