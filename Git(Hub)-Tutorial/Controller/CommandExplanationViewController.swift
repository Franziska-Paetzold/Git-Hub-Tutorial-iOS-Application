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
    var textView1: UITextView!
    
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
        
        //textView
        textView1 = UITextView()
        textView1.text = "Content of CommandExplanationView"
        textView1.backgroundColor = .white
        textView1.textColor = .black
        mainView.addSubview(textView1)
        
       
        //============adding constraints ============
        
        //##### main view #####
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        
        
        
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
        nextViewButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
        nextViewButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        
        //####### text view 1 ######
        textView1.translatesAutoresizingMaskIntoConstraints = false
        textView1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textView1.heightAnchor.constraint(equalToConstant: 80).isActive = true
        textView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        textView1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        textView1.isScrollEnabled = false
        textView1.isEditable = false
        textView1.isSelectable = false
 
        //============ adding logic ============
        
        //adds back to StartTutorial function to the back button
        backButton.addTarget(self, action: #selector(backToPrevoiusView(_:)), for: .touchUpInside)
        nextViewButton.addTarget(self, action: #selector(goToNextView(_:)), for: .touchUpInside)
    }
    
    //============ functions to come and go back ============
    @IBAction func backToPrevoiusView(_ sender: UIButton){
        self.performSegue(withIdentifier: "segueCommandExplanationToGitExplanationShort", sender: nil)
    }
    
    @IBAction func goToNextView(_ sender: UIButton){
        self.performSegue(withIdentifier: "segueCommandExplanationToCommandGame", sender: nil)
    }
    
    @IBAction func backToCommandExplanationController(segue: UIStoryboardSegue){
        print("Unwind to CommandExplanation")
    }

}
