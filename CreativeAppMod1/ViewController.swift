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
    @IBOutlet weak var ButtonOutlet: UIButton!
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
        LoadingOutlet.hidesWhenStopped = true
        self.LoadingOutlet.stopAnimating()
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonOutlet(_ sender: Any) {
        let numberOne = FirstNumberTextField.text!
        let numberTwo = SecondNumberTextField.text!
        Timer.scheduledTimer(withTimeInterval: 0.0, repeats: false) { [self] (t) in self.LoadingOutlet.startAnimating()
            InfoLabel.text = "Calculating Answer... Please Wait..."
        }
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [self] (t) in self.LoadingOutlet.stopAnimating()
            if let condition =  Double(numberOne){
                if let condition = Double(numberTwo){
                    let stepOne = Double(numberOne)! * Double(numberOne)!
                    let stepTwo = Double(numberTwo)! * Double(numberTwo)!
                    let stepThree = stepOne + stepTwo
                    let answer = stepThree.squareRoot()
                    InfoLabel.text = "Your C value is equal to \(answer). Enter your next set of A and B values in the Text Fields."
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

