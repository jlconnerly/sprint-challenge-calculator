//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

//
// MARK: - Enums
//

enum OperatorType: String {
    case addition = "+"
    case subtraction = "−"
    case division = "÷"
    case multiplication = "×"
}

//
// MARK: -  Beginning of CalculatorBrain Class
//

class CalculatorBrain {
    
    //
    //  MARK: - Properties
    //
    
    var operand1String = ""
    var operand2String = ""
    var operatorType: OperatorType?
    var displayText: String = ""
    var result: String = ""
    var posNeg: Bool = false
    
    //
    //  MARK: - Methods
    //
    
    
    func addOperandDigit(_ digit: String) -> String {
        var periodCount = 0
        if operatorType == nil {
            operand1String.append(digit)
            for char in operand1String {
                if char == "."{
                    periodCount += 1
                }
            }
            
            if digit == "." && operand1String.contains(".") && periodCount > 1 {
                operand1String.removeLast()
            }
            if posNeg == true {
                posNeg = false
                let neg = "-"
                operand1String = neg + operand1String
            }
            displayText = operand1String
        } else {
            periodCount = 0
            operand2String.append(digit)
            for char in operand2String {
                if char == "." {
                    periodCount += 1
                }
            }
            if digit == "." && operand2String.contains(".") && periodCount > 1 {
                operand2String.removeLast()
            }
            if posNeg == true {
                posNeg = false
                let neg = "-"
                operand2String = neg + operand2String
            }
            displayText = operand2String
        }
        return displayText
    }
    
    
    func setOperator(_ operatorString: String) {
        switch operatorString {
        case "+":
            operatorType = .addition
        case "−":
            operatorType = .subtraction
        case "÷":
            operatorType = .division
        case "×":
            operatorType = .multiplication
        default:
            operatorType = nil
        }
    }
    
    func calculateIfPossible() -> String? {
        if operand1String != "" || operand2String != "" || operatorType != nil {
            guard let number1 = Double(operand1String),
                  let number2 = Double(operand2String),
                  let selectedOperator = operatorType else { return "" }
            
            switch selectedOperator {
            case .addition:
                result = String(number1 + number2)
            case .subtraction:
                result = String(number1 - number2)
            case .multiplication:
                result = String(number1 * number2)
            case .division:
                if number1 == 0 || number2 == 0 {
                    result = "error"
                } else {
                    result = String(number1 / number2)
                }
            }
        } else {
            result = "error"
        }
        if result.contains(".0") {
            return result.replacingOccurrences(of: ".0", with: "")
        }else {
            return result
        }
    }
}
