//
//  GitExplanationViewController.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 19.06.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit

class GitExplanationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //back (button funktion) to this class
    //just a marker for the segue
    @IBAction func backToGitExplanationController(segue: UIStoryboardSegue) {
        print("Unwind to Git Explanation")
    }
    
    //needed because the associated view is not the only one pointig the next view
    //overwrites the sugueFromController variable from StartTutorialController class, to know which view was previous
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? StartTutorialViewController{        destination.segueFromController = "GitExplanationViewController"
        }
    }

}
