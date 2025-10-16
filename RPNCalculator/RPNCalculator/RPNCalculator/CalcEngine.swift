//
//  CalcEngine.swift
//  RPNCalculator
//
//  Created by Miro Six on 09/10/2025.
//

import Foundation
@Observable
class CalcEngine {
    var currentNumber : Double? = nil
    var numbers: [Double] = []
    var result: String = ""
    
    func addDigitToNumber (_ number: Int) {
        let numberToDouble: Double = Double(number)
        if currentNumber == nil {
            currentNumber = numberToDouble
        } else {
            currentNumber = currentNumber! * 10 + numberToDouble
        }
    }
    
    func enter() {
        if let currentNumber {
            numbers.append(currentNumber)
            self.currentNumber = nil
        }
    }
    
    func arrayToString(_ array: [Double]) -> String {
        let parts = array.map { "\($0)" }
        return "[\(parts.joined(separator: ","))]"
    }
    
    func addOperatorAndNumber(_ op: String) -> String {
        if let currentNumber {
            numbers.append(currentNumber)
            self.currentNumber = nil
        }
        
        guard numbers.count >= 2 else {
            return "not enough operands...\n"
        }
        
        let a = numbers.removeLast()
        let b = numbers.removeLast()
        
        let uitkomst: Double
        switch op {
        case "+":
            uitkomst = a + b
        case "-":
            uitkomst = a - b
        case "*":
            uitkomst = a * b
        case "/":
            uitkomst = a / b
        default:
            numbers.append(a)
            numbers.append(b)
            return ""
        }
        
        numbers.append(uitkomst)
        
        let line = "\(uitkomst)\n" + "\(op)\n"
        
        return line
    }
    
    func returnCurrentStack() -> String {
        return arrayToString(numbers) + "\(result)\n"
    }
    
    func clearCurrentNumber () {
        currentNumber = nil
    }
    
    func updateResult() -> String {
        return result
    }
}

