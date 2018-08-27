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
    
    var addCommandGameScene = AddCommandGameScene(size: CGSize(width: 0, height: 0))
    var initCommandGameScene = InitCommandGameScene(size: CGSize(width: 0, height: 0))
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var scenes = [addCommandGameScene, initCommandGameScene]
        
        
        //main view
        let commandGameView = view as! SKView
        commandGameView.showsFPS = false
        
        //access the right scene by CurrendCommand
        for scene in scenes{
            if (scene.name == CurrentCommand.name){
                //game scene
                scene.size = commandGameView.bounds.size
                scene.scaleMode = .aspectFill //over the full screen
                scene.myDelegate = self
                
                //show scene
                commandGameView.showsPhysics = false
                commandGameView.presentScene(scene)
            }
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
        //dispatchQueue istead of sleep method
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.performSegue(withIdentifier: "segueCommandGametoCommandFeedback", sender: nil)
        }
    }
}

