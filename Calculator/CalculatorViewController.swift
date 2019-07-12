//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var brain: CalculatorBrain?
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    // MARK: - Action Handlers
    
    @IBAction func operandTapped(_ sender: UIButton) {
        if let userInput = sender.titleLabel,
            let digitStr = userInput.text {
       outputLabel.text = brain?.addOperandDigit(digitStr)
        }
        
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let operandTitle = sender.titleLabel,
            let selectedOperand = operandTitle.text {
            brain?.setOperator(selectedOperand)
            // add highlighted button for stretch
        }
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        if let result = brain?.calculateIfPossible() {
            outputLabel.text = result
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        clearTransaction()
        outputLabel.text = "0"
    }
    
    // MARK: - Private
    
    private func clearTransaction() {
        
        brain = CalculatorBrain()
       
    }
}
