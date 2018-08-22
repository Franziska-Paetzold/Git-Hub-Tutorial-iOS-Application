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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? StartTutorialViewController{        destination.segueFromController = "GitExplanationShortViewController"
        }
    }
}
