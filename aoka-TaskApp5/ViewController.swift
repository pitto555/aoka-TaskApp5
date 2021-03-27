//
//  ViewController.swift
//  aoka-TaskApp5
//
//  Created by aoka on 2021/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.keyboardType = .numberPad
        textField2.keyboardType = .numberPad
    }
    
    @IBAction func calculationButton(_ sender: Any) {
        let number = Double(textField.text!) ?? 0
        let number2 = Double(textField2.text!) ?? 0
        
        if textField.text == "" {
            aleat(aleatText: "割られる数を入力して下さい")
            return
        }
        
        if textField2.text == "" {
            aleat(aleatText: "割る数を入力して下さい")
            return
        }
        
        if textField2.text == "0" {
            aleat(aleatText: "割る数には0を入力しないで下さい")
            return
        }
        
        let answerText = number / number2
        answerLabel.text = String(format: "%.5f", answerText)
    }
    
    private func aleat(aleatText: String) {
        let aleatAction = UIAlertController(title: "課題5", message: aleatText, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        aleatAction.addAction(action)
        present(aleatAction, animated: true, completion: nil)
    }
    
}

