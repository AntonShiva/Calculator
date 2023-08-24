//
//  ViewController.swift
//  Calculator
//
//  Created by Anton Rasen on 23.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayResultLabel: UILabel!
    var stillTyping = false
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        let textDisp = displayResultLabel.text!
        
        if stillTyping {
            if textDisp.count < 20 {
                displayResultLabel.text = displayResultLabel.text! + number
            }
        } else {
            displayResultLabel.text = number
            stillTyping = true
        }
    }
    
    
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
    }
    
    
    
        
    
 
  }
    
    

