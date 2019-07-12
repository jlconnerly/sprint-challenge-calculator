//
//  ViewController.swift
//  Calculator
//
//  Created by Ben Gohlke on 5/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //
    // MARK: -  IBOutlets and Properties
    //
    
    var brain: CalculatorBrain?
    
    @IBOutlet weak var outputLabel: UILabel!
    
    //
    // MARK: -  View LifeCycle
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain = CalculatorBrain()
    }
    
    //
    // MARK: - Action Handlers
    //
    
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
            brain?.posNeg = false
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
    
    @IBAction func posNegTapped(_ sender: UIButton) {
        brain?.posNeg.toggle()
        self.view.reloadInputViews()
    }
    
    //
    // MARK: - Private
    //
    private func clearTransaction() {
        
        brain = CalculatorBrain()
       
    }
}
