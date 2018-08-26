//
//  GitExplanationShortController.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 21.08.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit

class GitExplanationShortController: UIViewController {

    @IBAction func backToGitExplanationShortController(segue: UIStoryboardSegue) {
        print("Unwind to Git Explanation Short")
    }
    
    //overwrites the segueFromController variable from CommandExplanationViewController class, to know which view was previous
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CommandExplanationViewController{        destination.segueFromController = "GitExplanationShortViewController"
            CurrentCommand.commandNum = 0
        }
    }
}
