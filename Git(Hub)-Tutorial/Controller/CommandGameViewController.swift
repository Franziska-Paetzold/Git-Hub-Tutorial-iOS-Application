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
    
    var controlFlag = false
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //main view
        let commandGameView = view as! SKView
        commandGameView.showsFPS = false
        commandGameView.showsPhysics = false
        
        //TODO: refactoring
        let addCommandGameScene = AddCommandGameScene(newSize: commandGameView.bounds.size)
        let initCommandGameScene = InitCommandGameScene(newSize: commandGameView.bounds.size)
        let commitCommandGameScene = CommitCommandGameScene(newSize: commandGameView.bounds.size)
        let statusCommandGameScene = StatusCommandGameScene(newSize: commandGameView.bounds.size)
        
        let scenes = [addCommandGameScene, initCommandGameScene, commitCommandGameScene, statusCommandGameScene]
        
        for scene in scenes{
            if (scene.name == CurrentCommand.name){
                scene.myDelegate = self
                //show scene
                commandGameView.presentScene(scene)
                controlFlag = true
            }
        }
        
        if (!controlFlag){
            print("no more commands implemented")
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.performSegue(withIdentifier: "segueCommandGametoCommandFeedback", sender: nil)
        }
    }
}

