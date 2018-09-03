//
//  CommandExplanationViewController.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 25.06.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit

struct CurrentCommand{
    
    //static var num: Int!
    static var num: Int! = 0
    static let order = ["init", "add", "commit", "status"]
   // static let order = ["commit"]
    static var name = CurrentCommand.order[CurrentCommand.num]
}

class CommandExplanationViewController: UIViewController {
    
    //variables passed by incoming segues
    var segueFromController: String!
    
    var mainView: UIView!
    var backButton: UIButton!
    var nextViewButton: UIButton!
    var textView1: UITextView!
    
    
    let contentOfCommand =
        ["init" : "Nun gut, junger Seefahrtsneuling. Zu allererst müssen wir zu unserem Heimathafen gelangen. \n \n cd benutzer/kapitaen/heimathafen \n \n Es ist offensichtlich, dass wir für unsere Reise noch ein Schiff benötigen. Du siehst mir aus als könntest du ohne Probleme selbst eins bauen. Also los! \n \n git init\n \n Beachte: Als Git(Hub)- und vielleicht auch Terminalneuling, achte darauf in den richtigen Ordner zu wechseln und nicht nur zu dem Ordner, indem sich dein Zielordner befindet.",
         "add" : "add content",
         "commit" : "commit content",
         "status" : "status content",
         "help" : "help content"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("current command number: \(CurrentCommand.num!)")
        
        //=============initializing view tools ============
        
        //main view
        mainView = UIView()
        mainView.backgroundColor = .white
        self.view.addSubview(mainView)
        
        //back button
        backButton = UIButtonModel(type: "back", parent: self)
        mainView.addSubview(backButton)
        
        //next view button
        nextViewButton = UIButtonModel(type: "next", parent: self)
        mainView.addSubview(nextViewButton)
        
        //textView
        textView1 = UITextView()
        //the counter CurrentCommand.num chooses the name of the current command in the row of CurrentsCommand.commandOrder and so we can get from contentOfCommand the matching content for the command
        print("COMMAAAAAND NAME \(CurrentCommand.name)")
        textView1.text = contentOfCommand[CurrentCommand.name]
        textView1.backgroundColor = .white
        textView1.textColor = .black
        
        let newSize = textView1.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
        textView1.frame.size = CGSize(width: max(newSize.width, textView1.frame.size.width), height: max(newSize.height, textView1.frame.size.width))

        
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

        
        
        
        //####### text view 1 ######
        textView1.translatesAutoresizingMaskIntoConstraints = false
        textView1.widthAnchor.constraint(equalToConstant: self.view.frame.width-40).isActive = true
        textView1.heightAnchor.constraint(equalToConstant: self.view.frame.height-nextViewButton.frame.height-120).isActive = true
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
        if segueFromController == "CommandFeedbackViewController"{
            //segueIDs are set in the storyboard
            //nil chooses the defalt for the sender
            self.performSegue(withIdentifier: "segueCommandExplanationToCommandFeedback", sender: nil)
        }
        else if segueFromController == "GitExplanationShortViewController"{
            self.performSegue(withIdentifier: "segueCommandExplanationToGitExplanationShort", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CommandFeedbackViewController{        destination.segueFromController = "CommandExplanationViewController"
        }
    }
    
    @IBAction func goToNextView(_ sender: UIButton){
        self.performSegue(withIdentifier: "segueCommandExplanationToCommandGame", sender: nil)
        
    }
    
    
    
    @IBAction func backToCommandExplanationController(segue: UIStoryboardSegue){
        print("Unwind to CommandExplanation")
    }

}
