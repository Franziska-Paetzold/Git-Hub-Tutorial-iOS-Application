//
//  CommitCommandGameScene.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 28.08.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit
import SpriteKit

class CommitCommandGameScene: CommandGameSceneModel, UITextFieldDelegate {
    
    var commitTextField = UITextField()
    var counter = 0
    var showTextField = true
    var shipNode = ShipModel()
    var shipGo = false
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    private override init(size: CGSize) {
        super.init(size: size)
    }
    
    override func didMove(to view: SKView) {
        
        if showTextField {
            self.view?.addSubview(commitTextField)
        }
        else{
            commitTextField.removeFromSuperview()
            
            //launching ship
            let label = UILabel(frame: commitTextField.frame)
            label.text = commitTextField.text
            label.sizeThatFits(shipNode.size)
            self.view?.addSubview(label)
            
            //shipGo = true
            
            myDelegate?.didFinishTask(sender: self)
        }
    }
    
    convenience init(newSize: CGSize){
        self.init(size: newSize)
        //for command identification
        self.name = "commit"
        self.delay = true
        
        //============ initialization and configuration ship============
        //ship from shipModel
        shipNode = ShipModel(position: CGPoint(x: (size.width/2), y: (size.height/5)*3.5), physicsBodyEnabled: false)
        foregroundNode.addChild(shipNode)
        
        //======  textfield ======
        let textFieldSize =  CGSize(width: shipNode.size.width*0.7, height: 30)
        commitTextField = UITextField(frame: CGRect(origin: CGPoint(x: shipNode.position.x - (textFieldSize.width/2), y: shipNode.position.y - (shipNode.size.height/3.5))  , size: textFieldSize))
        
        commitTextField.delegate = self
        commitTextField.returnKeyType = .done
        
        commitTextField.backgroundColor = UIColor.white
        commitTextField.placeholder = "Welche Fracht ist geladen?"
        
    }
    
    /*
    override func update(_ currentTime: TimeInterval) {
        if(shipGo){
            var timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: Selector(("updateCounting")), userInfo: nil, repeats: true)}
    }
    
    
    func updateCounting(){
        NSLog("counting..")
        shipNode.position.x = shipNode.position.x-1
    }
    */
    /*
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        counter += 1
        if counter == 1 {
            showTextField = false
            didMove(to: self.view!)
        }
        if counter == 2 {
            myDelegate?.didFinishTask(sender: self)
        }
    }
    */
    //called every time user leaves keyboard
    func textFieldDidEndEditing(_ textField: UITextField){
        print("user left keyboard")
        if(textField.text!.isEmpty){
            showTextField = true
        }
        else{
            showTextField = false
        }
        
        didMove(to: self.view!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return pressed")
        commitTextField.resignFirstResponder()
        return false
    }
}
