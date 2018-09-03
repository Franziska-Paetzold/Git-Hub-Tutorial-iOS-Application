//
//  UIButtonModel.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 03.09.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import Foundation
import UIKit

class UIButtonModel: UIButton {
    
    var segue: String!
    var parent: UIViewController!
    var width = 50
    var height = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //super.addTarget(super, <#Any?#>, action: super.performSegue(withIdentifier: "segueCommandExplanationToCommandFeedback", sender: nil), for: <#UIControlEvents#>)
        
    }
    
    convenience init(type: String, parent: UIViewController){
        
        self.init(frame: CGRect(x: 20, y: 20, width: 50, height: 30) )
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.clear.cgColor
        
        self.parent = parent
        
        
        if (type == "back"){
            back()
        }
        else if (type == "next"){
            next()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func back(){
        self.setTitle("zurück", for: .normal)
        self.backgroundColor = colorFromRGB(r: 0, g: 122, b: 255)
        
    }
    
    func next(){
        self.setTitle("weiter", for: .normal)
        //self.backgroundColor = colorFromRGB(r: 255/255, g: 149/255, b: 0)
        self.backgroundColor = .orange
        //self.frame = CGRect(x: 200, y: 500, width: 50, height: 30)
        self.frame = CGRect(x: parent.view.frame.width/2-self.frame.width/2, y: parent.view.frame.height-20-self.frame.height, width: 50, height: 30)
       
    }
    
    func colorFromRGB(r: Int, g: Int, b: Int) -> UIColor {
        return UIColor(
            red: CGFloat((r & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((g & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(b & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
