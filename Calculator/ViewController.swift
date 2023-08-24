//
//  ViewController.swift
//  Calculator
//
//  Created by Anton Rasen on 23.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayResultLabel: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        displayResultLabel.text = displayResultLabel.text! + number
    }
    
    


}

