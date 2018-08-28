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
    var initCommandGameScene:InitCommandGameScene!
    
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
        //----add----
        addCommandGameScene = AddCommandGameScene(size: commandGameView.bounds.size)
        if (addCommandGameScene.name == CurrentCommand.name){
            addCommandGameScene.myDelegate = self
            //show scene
            commandGameView.presentScene(addCommandGameScene)
        }
        //----init----
        initCommandGameScene = InitCommandGameScene(size: commandGameView.bounds.size)
        if (initCommandGameScene.name == CurrentCommand.name){
            initCommandGameScene.myDelegate = self
            //show scene
            commandGameView.presentScene(initCommandGameScene)
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

