//
//  ViewController.swift
//  Calculator
//
//  Created by Chidi Emeh on 2/2/16.
//  Copyright © 2016 Chidi Emeh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mathSigns: Int = 0
    var setZero: Bool = true
    var operand: Int = 0

    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func numericPressed(sender: AnyObject) {
        
        if setZero {
            resultLabel.text = "0"
            setZero = false
        }
        
        var result: Int = Int(resultLabel.text!)!
        result = result * 10 + sender.tag!
        resultLabel.text = "\(result)"
        
    }
    
    
    @IBAction func clearPressed(sender: AnyObject) {
        resultLabel.text = "0"
    }
    
    
    @IBAction func equalsPressed(sender: AnyObject) {
        
        operand = calculateResult(oprtr: mathSigns)
        resultLabel.text = "\(operand)"
        mathSigns = 0
        setZero = true
        
    }
    
    
    
    @IBAction func operatorPressed(sender: AnyObject) {
        
        if mathSigns != 0 {
            
            operand = calculateResult(oprtr: mathSigns)
            resultLabel.text = "\(operand)"
            setZero = true
            mathSigns = sender.tag
            
        } else {
            
            let resultWhenOperatorIsPressed: Int = Int(resultLabel.text!)!
            operand = resultWhenOperatorIsPressed
            setZero = true
            mathSigns = sender.tag
            
        }
        

        
    }
    
    
    func calculateResult(oprtr oprtr: Int) -> Int {
        
        var returnValue: Int = Int(resultLabel.text!)!
        
        
        switch(oprtr) {
            
        case 1 :
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
        
        setZero = true
        mathSigns = 0
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

