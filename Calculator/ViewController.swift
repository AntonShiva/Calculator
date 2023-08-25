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
    // переменная для второго операнда
    var secondOperand: Double = 0
    // переменная знака производящего дейсвие с операндами
    var operationSing: String = ""
    
    // переменная трансформирующая формат text из верхней строки displayReasultLabel в Double
    var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            // для того что бы убрать .0 (ноль) после точки в результате
            // создаем переменную с новым значение и массив
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                displayResultLabel.text = "\(valueArray[0])"
            } else {
                displayResultLabel.text = "\(newValue)"
            }
            // что бы можно было вводить новое число
            stillTyping = false
        }
    }
    //_____________________Переменные-индикаторы_______________________________________
    // переменная индикатор для дробного числа (определяет указывали мы
    //что это число дробное
    var dotIsPlaced = false
    // переменная индикатор определяющая в теле nemberPressed порядок ветвления if
    // когда она false, то в if ноль заменяеться на введенное значение
    var stillTyping = false
    //_________________________________________________________________________________
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
    // + - × ÷
    @IBAction func twoOperandsSignPressed(_ sender: UIButton) {
        operationSing = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        dotIsPlaced = false
        
    }
    // универсальная функция принимающая клоужеры из equalitySingPresset из кейсов в свиче
    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    // кнопка = (знак равенства)
    @IBAction func equalitySignPresset(_ sender: UIButton) {
        // передаем во второй опернад значение
        if stillTyping {
            secondOperand = currentInput
        }
        dotIsPlaced = false
        
        switch operationSing {
           case "+":
            operateWithTwoOperands{$0 + $1}
           case "-":
            operateWithTwoOperands{$0 - $1}
           case "×":
            operateWithTwoOperands{$0 * $1}
           case "÷":
            operateWithTwoOperands{$0 / $1}
        default: break
        }
    }
    // кнопка - "С" (обнуление)
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultLabel.text = "0"
        operationSing = ""
        stillTyping = false
        dotIsPlaced = false
    }
    
    // +/- меняет то что находиться на дисплее на противоположный знак
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
      currentInput = -currentInput
    }
    // %
    @IBAction func percentageButtonPressed(_ sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
        }
        stillTyping = false
    }
    // √ квадратный корень
    @IBAction func squareRootButtonPressed(_ sender: UIButton) {
       currentInput = sqrt(currentInput)
    }
    // . выделение дробной части числа
    @IBAction func dotButtonPressed(_ sender: UIButton) {
        if stillTyping && !dotIsPlaced {
            displayResultLabel.text = displayResultLabel.text! + "."
            dotIsPlaced = true
        } else if !stillTyping && !dotIsPlaced {
            displayResultLabel.text = "0"
        }
    }
    
    
  }
    
    

