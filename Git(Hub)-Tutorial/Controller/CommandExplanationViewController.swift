//
//  CommandExplanationViewController.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 25.06.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit

class CommandExplanationViewController: UIViewController {

    var mainView: UIView!
    var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //=============initializing view tools ============
        
        //initialize main view
        mainView = UIView()
        mainView.backgroundColor = .red
        self.view.addSubview(mainView)
        
        //initialize back button
        backButton = UIButton()
        backButton.setTitle("zurück", for: .normal)
        backButton.titleLabel?.textAlignment = .center
        backButton.backgroundColor = .black
        backButton.setTitleColor(.white, for: .normal)
        mainView.addSubview(backButton)
        
        //============adding constraints ============
        
        //add constrains to main view
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leftAnchor.constraintEqualToSystemSpacingAfter(mainView.leftAnchor, multiplier: 0.5) //ToDo: doesnt work
        
        //============adding logic ============
        
        //adds back to StartTutorial function to the back button
        backButton.addTarget(self, action: #selector(backButtonFunction(_: )), for: .touchUpInside)
    }
    
    @IBAction func backButtonFunction(_ sender: UIButton){
        self.performSegue(withIdentifier: "segueCommandExplanationToStartTutorial", sender: nil)
    }
    
    @IBAction func backToCommandExplanationController(segue: UIStoryboardSegue){
        print("Unwind to CommandExplanation")
    }

}
