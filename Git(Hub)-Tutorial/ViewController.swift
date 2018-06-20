//
//  ViewController.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 19.06.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backToStartController(segue: UIStoryboardSegue) {
        print("Unwind to Start View")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destination = segue.destination as! StartTutorialViewController
        destination.segueFromController = "StartViewController"
        
    }
    
}

