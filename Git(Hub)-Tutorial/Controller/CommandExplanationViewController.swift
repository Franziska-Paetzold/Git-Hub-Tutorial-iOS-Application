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
        
        //create main view
        mainView = UIView()
        mainView.backgroundColor = .red
        self.view.addSubview(mainView)
        
        //create back button
        backButton = UIButton()
        backButton.setTitle("zurück", for: .normal)
        backButton.titleLabel?.textAlignment = .center
        backButton.backgroundColor = .black
        backButton.setTitleColor(.white, for: .normal)
        mainView.addSubview(backButton)
        
        
        //add constrains to main view
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1).isActive = true
        mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
    backButton.leftAnchor.constraintEqualToSystemSpacingAfter(mainView.leftAnchor, multiplier: 0.1)
        
        //backButton.addTarget(self, action: , for: <#T##UIControlEvents#>)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToCommandExplanationController(segue: UIStoryboardSegue){
        print("Unwind to CommandExplanation")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
