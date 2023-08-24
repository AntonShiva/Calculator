//
//  ViewController.swift
//  Calculator
//
//  Created by Anton Rasen on 23.08.2023.
//

import UIKit

class ViewController: UIViewController {
    // аутлет верней строки
    @IBOutlet weak var displayResultLabel: UILabel!
    
    
    // переменная для первого операнда
    var firstOperand: Double = 0
    
    // переменная трансформирующая формат text из верхней строки displayReasultLabel в Double
    var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            displayResultLabel.text = "\(newValue)"
            // что бы можно было вводить новое число
            stillTyping = false
        }
    }
    
    // переменная определяющая в теле nemberPressed порядок ветвления if
    // когда она false, то ноль заменяеться на введенное значение
    var stillTyping = false
    // кнопки цифр
    @IBAction func numberPressed(_ sender: UIButton) {
    // номер нажатой цифры
    let number = sender.currentTitle!
   
    // вывод на экран цифр с ограничением в 20 знаков
    if stillTyping {
            if displayResultLabel.text!.count < 20 {
                displayResultLabel.text = displayResultLabel.text! + number
            }
        } else {
            displayResultLabel.text = number
            stillTyping = true
        }
    }
    
    
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
      
        firstOperand = currentInput
    }
    
    
    
        
    
 
  }
    
    

