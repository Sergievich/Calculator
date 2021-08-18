//
//  ViewController.swift
//  Calculator
//
//  Created by Artiom on 17.08.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var actionsLbl: UILabel!
    var stillTyping = false
    var dotIsPlace = false
    
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    
    var currentInput: Double{
        get{
            return Double(resultLbl.text!)!
        } set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0"{
                resultLbl.text = "\(valueArray[0])"
            } else {
                resultLbl.text = "\(newValue)"
            }
            stillTyping = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        print (number)
        
        if stillTyping == true{
        if resultLbl.text!.count < 20  {
            resultLbl.text = resultLbl.text! + number
        }
        } else {
            resultLbl.text = number
            stillTyping = true
        }
    
}
    
    @IBAction func twoOpperntsSignPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        print (firstOperand)
        dotIsPlace = false
        
    }
    
    func operarteWithTwoOperand(operation: (Double, Double) -> Double){
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
    }
    
    @IBAction func equalitySignPressed(_ sender: UIButton) {
        
        if stillTyping {
            secondOperand = currentInput
        }
        
        dotIsPlace = false
        
        switch operationSign {
        case "+":
            operarteWithTwoOperand{$0 + $1}
        case "-":
            operarteWithTwoOperand{$0 - $1}
        case "✕":
            operarteWithTwoOperand{$0 * $1}
        case "÷":
            operarteWithTwoOperand{$0 / $1}
        default: break
        }
    }
    
    @IBAction func clearBtnPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        resultLbl.text = "0"
        stillTyping = false
        operationSign = ""
        dotIsPlace = false
        
    }
    
    @IBAction func plusMinusBtnPressed(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    @IBAction func percentageBtnPressed(_ sender: UIButton) {
        if firstOperand == 0{
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput/100
        }
         
    }
    
    @IBAction func squareRootBtnPressed(_ sender: UIButton) {
        
        currentInput = sqrt(currentInput)
        
    }
    
    @IBAction func dotBtnPressed(_ sender: UIButton) {
        if stillTyping && !dotIsPlace{
            resultLbl.text = resultLbl.text! + "."
        } else if !stillTyping && !dotIsPlace{
            resultLbl.text = "0."
        }
    }
    
}

