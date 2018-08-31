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
    /*
    var scrollView: UIScrollView!
    var contentView: UIView!
    
    // Constraints
    var constraintContentHeight: NSLayoutConstraint!
    
    var lastOffset: CGPoint!
    var keyboardHeight: CGFloat!
    */
    
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
            self.view?.addSubview(label)
            
        }
    }
    
    convenience init(newSize: CGSize){
        self.init(size: newSize)
        //for command identification
        self.name = "commit"
        
        //============ initialization and configuration ship============
        //ship from shipModel
        let shipNode = ShipModel(position: CGPoint(x: (size.width/2), y: (size.height/5)*3.5), physicsBodyEnabled: false)
        foregroundNode.addChild(shipNode)
        
        //======  textfield ======
        let textFieldSize =  CGSize(width: shipNode.size.width*0.7, height: 30)
        commitTextField = UITextField(frame: CGRect(origin: CGPoint(x: shipNode.position.x - (textFieldSize.width/2), y: shipNode.position.y - (shipNode.size.height/3.5))  , size: textFieldSize))
        
        commitTextField.delegate = self
        commitTextField.returnKeyType = .done
        
        commitTextField.backgroundColor = UIColor.white
        commitTextField.placeholder = "Welche Fracht ist geladen?"
        
        //TODO: text input needs boundaries... like 160 char or so
        commitTextField.text = "add package"
       
    }
    
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
    
    /*
    func textFieldDidEndEditing(_ textField: UITextField){
        print("reached end of edit")
        if(textField.text!.isEmpty){
            print("bla")
        }
    }
    
   
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("return pressed")
        commitTextField.resignFirstResponder()
        return false
    }
    */
    /*
     func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
     lastOffset = self.scrollView.contentOffset
     return true
     }
     
    func keyboardWillShow(notification: NSNotification) {
        if keyboardHeight != nil {
            return
        }
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardHeight = keyboardSize.height
            // so increase contentView's height by keyboard height
            UIView.animate(withDuration: 0.3, animations: {
                self.constraintContentHeight.constant += self.keyboardHeight
            })
            // move if keyboard hide input field
            let distanceToBottom = self.scrollView.frame.size.height - (commitTextField.frame.origin.y) - (commitTextField.frame.size.height)
            let collapseSpace = keyboardHeight - distanceToBottom
            if collapseSpace < 0 {
                // no collapse
                return
            }
            // set new offset for scroll view
            UIView.animate(withDuration: 0.3, animations: {
                // scroll to the position above keyboard 10 points
                self.scrollView.contentOffset = CGPoint(x: self.lastOffset.x, y: collapseSpace + 10)
            })
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.constraintContentHeight.constant -= self.keyboardHeight
            self.scrollView.contentOffset = self.lastOffset
        }
        keyboardHeight = nil
    }
    */
    
}
