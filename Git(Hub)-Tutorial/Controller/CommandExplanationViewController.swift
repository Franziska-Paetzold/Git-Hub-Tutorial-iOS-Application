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
    var nextViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //=============initializing view tools ============
        
        //main view
        mainView = UIView()
        mainView.backgroundColor = .red
        self.view.addSubview(mainView)
        
        //back button
        backButton = UIButton()
        backButton.setTitle("zurück", for: .normal)
        backButton.titleLabel?.textAlignment = .center
        backButton.titleLabel?.adjustsFontSizeToFitWidth = true
        backButton.backgroundColor = .black
        backButton.setTitleColor(.white, for: .normal)
        mainView.addSubview(backButton)
        
        //next view button
        nextViewButton = UIButton()
        nextViewButton.setTitle("weiter", for: .normal)
        nextViewButton.titleLabel?.textAlignment = .center
        nextViewButton.titleLabel?.adjustsFontSizeToFitWidth = true
        nextViewButton.backgroundColor = .green
        nextViewButton.setTitleColor(.black, for: .normal)
        mainView.addSubview(nextViewButton)
        
        //============adding constraints ============
        
        //##### main view #####
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        /*
        mainView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
        mainView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        mainView.topAnchor.constraintEqualToSystemSpacingBelow(view.safeAreaLayoutGuide.topAnchor, multiplier: 1.0)
        view.safeAreaLayoutGuide.bottomAnchor.constraintEqualToSystemSpacingBelow(mainView.bottomAnchor, multiplier: 1.0)
        */
        
        //##### back button #####
        //enables autolayout for the button
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        backButton.leftAnchor.constraintEqualToSystemSpacingAfter(mainView.leftAnchor, multiplier: 0.5).isActive = true//ToDo: doesnt work
        
        //###### next view button #####
        nextViewButton.translatesAutoresizingMaskIntoConstraints = false
        nextViewButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nextViewButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nextViewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        nextViewButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        //============ adding logic ============
        
        //adds back to StartTutorial function to the back button
        backButton.addTarget(self, action: #selector(backToPrevoiusView(_:)), for: .touchUpInside)
        nextViewButton.addTarget(self, action: #selector(goToNextView(_:)), for: .touchUpInside)
    }
    
    //============ functions to come and go back ============
    @IBAction func backToPrevoiusView(_ sender: UIButton){
        self.performSegue(withIdentifier: "segueCommandExplanationToPromise", sender: nil)
    }
    
    @IBAction func goToNextView(_ sender: UIButton){
        self.performSegue(withIdentifier: "segueCommandExplanationToCommandGame", sender: nil)
    }
    
    @IBAction func backToCommandExplanationController(segue: UIStoryboardSegue){
        print("Unwind to CommandExplanation")
    }

}
