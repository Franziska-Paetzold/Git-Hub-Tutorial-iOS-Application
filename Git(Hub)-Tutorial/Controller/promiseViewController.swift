//
//  promiseViewController.swift
//  Git(Hub)-Tutorial
//
//  Created by Franziska Pätzold on 26.06.18.
//  Copyright © 2018 Franziska Pätzold. All rights reserved.
//

import UIKit

class PromiseViewController: UIViewController {
    
    var firstButtonFlag: Bool
    var secondButtonFlag: Bool
    var thirdButtonFlag: Bool
 
    required init?(coder: NSCoder) {
        firstButtonFlag = coder.decodeBool(forKey: "firstButtonFlag")
        secondButtonFlag = coder.decodeBool(forKey: "sencondButtonFlag")
        thirdButtonFlag = coder.decodeBool(forKey: "thirdButtonFlag")
        super.init(coder: coder)
    }
    
    init (firstFlag: Bool, secondFlag: Bool, thirdFlag: Bool){
        self.firstButtonFlag = firstFlag
        self.secondButtonFlag = secondFlag
        self.thirdButtonFlag = thirdFlag
        super.init(nibName: nil, bundle: nil)
    }
    
    @IBAction func firstButtonClicked(_ button: UIButton) {
        firstButtonFlag = checkbox(button: button, flag: firstButtonFlag)
    }
    
    @IBAction func secondButtonClicked(_ button: UIButton) {
        secondButtonFlag = checkbox(button: button, flag: secondButtonFlag)
    }
    
    @IBAction func thirdButtonClicked(_ button: UIButton) {
        thirdButtonFlag = checkbox(button: button, flag: thirdButtonFlag)
    }
    
    //changes the state of the button to selected if unselected or unselected if the button (used as checkbox) is selected
    //changes the to the button assiciated flag
    //returns the flag value to initialize firstButtonFlag, secondButtonFlag, thirdButtonFlag
    func checkbox(button: UIButton, flag: Bool) -> Bool {
        var flag = flag
        if button.isSelected == true{
            button.isSelected = false
            flag = false
        }
        else{
            button.isSelected = true
            flag = true
        }
        return flag
    }
    
    
    
    @IBAction func nextPage(_ sender: Any) {
        if (firstButtonFlag && secondButtonFlag && thirdButtonFlag)
        {
            print("yeay, we can go on")
        }
        else{
            print("first flag: \(firstButtonFlag)")
            print("hey these things are required, you have to agree first")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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