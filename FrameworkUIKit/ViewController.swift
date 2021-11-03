//
//  ViewController.swift
//  FrameworkUIKit
//
//  Created by Алина on 03.11.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Label
        label.isHidden = true // скрываем лейбл
        label.font = label.font.withSize(35) // меняем размер шрифта
        label.textColor = .red // меняем цвет шрифта (.red == UICoLor.red)
        
        // MARK: button
        button.setTitle("Get result", for: .normal) // меняем заголовок кнопки
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .green
    }

    @IBAction func pressedButton(_ sender: UIButton) {
        
        if label.isHidden {
            label.text = "Hello World!"
            
            button.setTitle("Clear", for: .normal) // меняем заголовок кнопки
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .red
            label.isHidden = false
            
            
        } else {
            
            button.setTitle("Get result", for: .normal) // меняем заголовок кнопки
            button.setTitleColor(.blue, for: .normal)
             button.backgroundColor = .green
            label.isHidden = true
            
            
            
        }
    }
    
}

