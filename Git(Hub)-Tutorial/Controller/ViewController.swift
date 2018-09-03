//
//  ViewController.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 19.06.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.cornerRadius = 5
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.clear.cgColor
        
        button2.layer.cornerRadius = 5
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.clear.cgColor
        
       }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backToStartController(segue: UIStoryboardSegue) {
        print("Unwind to Start View")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? StartTutorialViewController{
        destination.segueFromController = "StartViewController"
        }
        
    }
    
}

