//
//  ViewController.swift
//  Calculator
//
//  Created by Anshul on 8/8/16.
//  Copyright © 2016 Anshul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var displayBox: UILabel!
    var inthemiddleoftyping = false

    @IBAction private func touchedDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if inthemiddleoftyping {
            let tempvar = displayBox!.text!
            displayBox.text! = tempvar + digit
        }
        else{displayBox.text! = digit}
        inthemiddleoftyping = true
    }
    @IBAction private func ClearButton(sender: UIButton) {
        if (((displayBox.text!) != "")&&((displayBox.text!) != "0")){
            displayBox.text!.removeAtIndex(displayBox.text!.endIndex.predecessor())}
        else {displayBox.text! = "0"}
    }
    
    private var DisplayText: Double{
        get{ return Double(displayBox.text!)!}
        set {displayBox.text! = String(newValue)}
    }
    
    private var brain = CalcBrain()
    
    @IBAction private func SpecialFunctions(sender: UIButton) {
        if let mathSymbol = sender.currentTitle
            {brain.performOperation(mathSymbol)}
        DisplayText = brain.result
        
    }
}

 