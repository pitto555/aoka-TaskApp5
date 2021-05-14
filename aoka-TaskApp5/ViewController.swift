//
//  ViewController.swift
//  aoka-TaskApp5
//
//  Created by aoka on 2021/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    
    @IBOutlet private weak var answerLabel: UILabel!
    
    enum UserError: Error {
        case emptyLeftTextField
        case emptyRightTextField
        case divisionByZero
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.keyboardType = .numberPad
        textField2.keyboardType = .numberPad
    }
    
    @IBAction func calculationButton(_ sender: Any) {
        do {
            let answer = try calField()
            answerLabel.text = String(answer)
        } catch let error as UserError {
            
            switch error {
            case .emptyLeftTextField:
                aleat(aleatText: "割られる数を入力して下さい")
            case .emptyRightTextField:
                aleat(aleatText: "割る数を入力して下さい")
            case .divisionByZero:
                aleat(aleatText: "割る数には0を入力して下さい。")
            
            }
        } catch {
            print("その他エラー")
        }
    }
    
    private func aleat(aleatText: String) {
        let aleatAction = UIAlertController(title: "課題5", message: aleatText, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        
        aleatAction.addAction(action)
        present(aleatAction, animated: true, completion: nil)
    }
    
    private func calField() throws -> Float {
        guard  !textField.text!.isEmpty else{
            throw UserError.emptyLeftTextField
        }
        guard !textField2.text!.isEmpty else{
            throw UserError.emptyRightTextField
        }
        let number = Float(textField.text!) ?? 0
        let number2 = Float(textField2.text!) ?? 0
        
        guard number2 != 0 else {
            throw UserError.divisionByZero
        }
        return number / number2
    }
}
