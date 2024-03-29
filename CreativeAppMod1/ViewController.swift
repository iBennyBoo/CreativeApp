//
//  ViewController.swift
//  CreativeAppMod1
//
//  Created by Benjamin Berman on 9/1/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var FirstNumberLabel: UILabel!
    @IBOutlet weak var SecondNumberLabel: UILabel!
    @IBOutlet weak var FirstNumberTextField: UITextField!
    @IBOutlet weak var SecondNumberTextField: UITextField!
    @IBOutlet weak var InfoLabel: UILabel!
    @IBOutlet weak var AnswerLabel: UILabel!
    @IBOutlet weak var ButtonOutlet: UIButton!
    @IBOutlet weak var SwitchEquationButton: UIButton!
    @IBOutlet weak var LoadingOutlet: UIActivityIndicatorView!
    var x = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        FirstNumberTextField.delegate = self
        SecondNumberTextField.delegate = self
        let black = UIColor.black
        FirstNumberLabel.layer.borderColor = black.cgColor
        SecondNumberLabel.layer.borderColor = black.cgColor
        InfoLabel.layer.borderColor = black.cgColor
        FirstNumberLabel.layer.borderWidth = 1
        SecondNumberLabel.layer.borderWidth = 1
        InfoLabel.layer.borderWidth = 1
        ButtonOutlet.layer.borderColor = black.cgColor
        ButtonOutlet.layer.borderWidth = 1
        ButtonOutlet.layer.cornerRadius = 40
        SwitchEquationButton.layer.borderColor = black.cgColor
        SwitchEquationButton.layer.borderWidth = 1
        SwitchEquationButton.layer.cornerRadius = 40
        AnswerLabel.layer.borderColor = black.cgColor
        AnswerLabel.layer.borderWidth = 1
        LoadingOutlet.hidesWhenStopped = true
        self.LoadingOutlet.stopAnimating()
        AnswerLabel.isHidden = true
        
        // Do any additional setup after loading the view.
    }

    @IBAction func SwitchEquationButton(_ sender: Any) {
        if(x == 0){
            AnswerLabel.isHidden = true
        FirstNumberLabel.text = "A or B Value"
        SecondNumberLabel.text = "C Value"
        InfoLabel.text = "Welcome to the Pythagorean Theorem Calculator! Enter your A/B and C values in the Text Fields."
            x = 1
        } else if (x == 1){
            FirstNumberLabel.text = "A Value"
            SecondNumberLabel.text = "B Value"
            InfoLabel.text = "Welcome to the Pythagorean Theorem Calculator! Enter your A and B values in the Text Fields."
            x = 0
        }
    }
    
    
    @IBAction func ButtonOutlet(_ sender: Any) {
        AnswerLabel.isHidden = true
        InfoLabel.text = ""
        let numberOne = FirstNumberTextField.text!
        let numberTwo = SecondNumberTextField.text!
        Timer.scheduledTimer(withTimeInterval: 0.0, repeats: false) { [self] (t) in self.LoadingOutlet.startAnimating()
            InfoLabel.text = "Calculating Answer... Please Wait..."
        }
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [self] (t) in self.LoadingOutlet.stopAnimating()
            if let condition =  Double(numberOne){
                if let condition = Double(numberTwo){
                    if(x==0){
                        let stepOne = Double(numberOne)! * Double(numberOne)!
                    let stepTwo = Double(numberTwo)! * Double(numberTwo)!
                    let stepThree = stepOne + stepTwo
                    let stepFour = stepThree.squareRoot()
                    let answer = round(stepFour * 1000.0)/1000.0
                        AnswerLabel.isHidden = false
                    AnswerLabel.text = "\(answer)"
                    InfoLabel.text = "Enter your next set of values in the Text Fields."
                    } else if (x == 1){
                        let stepOne = Double(numberOne)! * Double(numberOne)!
                        let stepTwo = Double(numberTwo)! * Double(numberTwo)!
                        let stepThree = -(stepTwo - stepOne)
                        print(stepThree)
                        let stepFour = stepThree.squareRoot()
                        let answer = round(stepFour * 1000.0)/1000.0
                        
                        if(stepTwo >= stepOne){
                            AnswerLabel.isHidden = false
                            AnswerLabel.text = "Error!"
                        } else{
                            AnswerLabel.isHidden = false
                            AnswerLabel.text = "\(answer)"
                            print(answer)
                            InfoLabel.text = "Enter your next set of values in the Text Fields."
                        }
                    }
                }else{
                    InfoLabel.text = "One or both of your values is not a number, please try again"
                }
            } else{
                InfoLabel.text = "One or both of your values is not a number, please try again."
            }
            
        }
        
        FirstNumberTextField.resignFirstResponder()
        SecondNumberTextField.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        FirstNumberTextField.resignFirstResponder()
        SecondNumberTextField.resignFirstResponder()
        return true
        
    }
    
}
