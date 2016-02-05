//
//  ViewController.swift
//  Calculator
//
//  Created by Chidi Emeh on 2/3/16.
//  Copyright © 2016 Chidi Emeh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //For the operator signs (no button has been pressed)
    var op: Int = 0
    
    //Set resultLabel to zero when an operator is pressed
    //instead of continuing concatenating zero
    var setZero: Bool = true
    
    //Get the value of the number typed before hitting an operator sign
    var operand: Int = 0
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numericPressed(sender: AnyObject) {
        
        //If a
        if setZero {
            resultLabel.text = "0"
            setZero = false
        }
        
        
        //Get input from user and convert to int
        //So that the next number typed increases by * 10
        //Then set the output to value of result
        
        var result: Int = Int(resultLabel.text!)!
        result = result * 10 + sender.tag!
        resultLabel.text = "\(result)"
        
    }
    
    
    @IBAction func clearPressed(sender: AnyObject) {
        //if clear button is pressed set the resultLabel to 0
        resultLabel.text = "0"
        
    }
    
    
    @IBAction func equalsPressed(sender: AnyObject) {
        
        operand = calculateResult(oprtr: op)
        resultLabel.text = "\(operand)"
        op = 0
        setZero = true
    }
    
    
    @IBAction func operatorPressed(sender: AnyObject) {
        
        if op != 0{
            
            operand = calculateResult(oprtr: op)
            resultLabel.text = "\(operand)"
            setZero = true
            op = sender.tag
            
        }else {
            
            let res: Int = Int(resultLabel.text!)!
            operand = res
            setZero = true
            op = sender.tag
            
        }
       
        
    }
    
    
    func calculateResult(oprtr oprtr: Int) -> Int {
        
        var returnValue: Int = Int(resultLabel.text!)!
        
        switch(oprtr) {
            
        case 1:
            returnValue = operand * returnValue
            break
        
        case 2:
            returnValue = operand / returnValue
            break
            
        case 3:
            returnValue = operand + returnValue
            break

        case 4:
            returnValue = operand - returnValue
            break
            
        default:
            break
            

        }
        return returnValue
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Incase there is another screen, 
        //once it loads set resultLabel to zero
        //and the operator signs to zero
        
        
        setZero = true
        op = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

