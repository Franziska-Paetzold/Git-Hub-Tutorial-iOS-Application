//
//  StartTutorialViewController.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 19.06.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit

class StartTutorialViewController: UIViewController {
    
    //ToDo: initializer
    var segueFromController: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backToStartTutorialController(segue: UIStoryboardSegue) {
        print("Unwind to StartTutorial")
    }
    
    @IBAction func backToPreviousController(_ sender: Any) {
        //segueFromController will be overwritten in the different view controllers
        if segueFromController == "StartViewController"{
            //segueIDs are set in the storyboard
            //nil chooses the defalt for the sender
            self.performSegue(withIdentifier: "segueStartTutorialToStart", sender: nil)
        }
        else if segueFromController == "GitExplanationViewController"{
            self.performSegue(withIdentifier: "segueStartTutorialToGitExplanation", sender: nil)
        }
    }
    
}
