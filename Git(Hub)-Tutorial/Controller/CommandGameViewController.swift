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
    var commitCommandGameScene: CommitCommandGameScene!
    var statusCommandGameScene: StatusCommandGameScene!
    
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
        //----add----
        addCommandGameScene = AddCommandGameScene(size: commandGameView.bounds.size)
        if (addCommandGameScene.name == CurrentCommand.name){
            addCommandGameScene.myDelegate = self
            //show scene
            addCommandGameScene.myDelegate = self
            commandGameView.presentScene(addCommandGameScene)
            controlFlag = true
        }
        //----init----
        initCommandGameScene = InitCommandGameScene(size: commandGameView.bounds.size)
        if (initCommandGameScene.name == CurrentCommand.name){
            initCommandGameScene.myDelegate = self
            //show scene
            commandGameView.presentScene(initCommandGameScene)
            controlFlag = true
        }
        //----commit----
        commitCommandGameScene = CommitCommandGameScene(size: commandGameView.bounds.size)
        if (commitCommandGameScene.name == CurrentCommand.name){
            commitCommandGameScene.myDelegate = self
            //show scene
            commandGameView.presentScene(commitCommandGameScene)
            controlFlag = true
        }
        //----status----
        statusCommandGameScene = StatusCommandGameScene(size: commandGameView.bounds.size)
        if (statusCommandGameScene.name == CurrentCommand.name){
            statusCommandGameScene.myDelegate = self
            //show scene
            commandGameView.presentScene(statusCommandGameScene)
            controlFlag = true
        }
        
        if (!controlFlag){
            print("ups")
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

