//
//  CommandFeedbackViewController.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 23.08.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit

class CommandFeedbackViewController: UIViewController {
    
    var segueFromController: String!
    
    var popUpFlag = false
    
    var mainView: UIView!
    var nextViewButton: UIButton!
    var textView1: UITextView!
    
    let contentOfCommand =
        ["init" : "Hinweis: init content",
         "add" : "Hinweis: add content",
         "commit" : "Hinweis: commit content",
         "status" : "Hinweis: status content",
         "help" : "Hinweis: help content"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //=============initializing view tools ============
        
        //main view
        mainView = UIView()
        mainView.backgroundColor = .white
        self.view.addSubview(mainView)
        
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
        //the counter CurrentCommand.num chooses the name of the current command in the row of CurrentsCommand.commandOrder and so we can get from contentOfCommand the matching content for the command
        textView1.text = contentOfCommand[CurrentCommand.name]
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
        nextViewButton.addTarget(self, action: #selector(goToNextView(_:)), for: .touchUpInside)
    }
    
    //============ functions to come and go back ============
    
    @IBAction func goToNextView(_ sender: UIButton){
        if let origin = segueFromController{
            if origin == "CommandExplanationViewController"{
                //CurrentCommand.num doesn't change if the user went just back from the CommandExplanationView
                self.performSegue(withIdentifier: "segueCommandFeedbackToCommandExplanation", sender: nil)
            }
            else if origin == "CommandGameViewController"{
                CurrentCommand.num = CurrentCommand.num+1
                if CurrentCommand.num == CurrentCommand.order.count{
                    //currently end of tutorial
                    self.performSegue(withIdentifier: "segueCommandFeedbackToPopUp", sender: nil)
                }
                else{
                    CurrentCommand.name = CurrentCommand.order[CurrentCommand.num]
                    self.performSegue(withIdentifier: "segueCommandFeedbackToCommandExplanation", sender: nil)
                }
            }
        }
    }
    
    //overwrites the segueFromController variable from CommandExplanationViewController class, to know which view was previous
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CommandExplanationViewController{        destination.segueFromController = "CommandFeedbackViewController"
        }
        
    }
    
    @IBAction func backToCommandFeedbackController(segue: UIStoryboardSegue){
        print("Unwind to CommandFeedback")
    }
    
    
    
}
