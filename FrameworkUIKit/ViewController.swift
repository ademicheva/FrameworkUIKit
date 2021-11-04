//
//  ViewController.swift
//  FrameworkUIKit
//
//  Created by Алина on 03.11.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.isHidden = true
        button.setTitle("Готово!", for: .normal)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        label.isHidden = false
        guard textField.text?.isEmpty == false else { return }
        
        if let _ = Double(textField.text!) {
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your name", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok!", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            textField.text = nil
        } else {
            label.text = textField.text
            textField.text = nil
        }
    }
}
