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
    @IBOutlet var actionButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Label
        label.isHidden = true // скрываем лейбл
        label.font = label.font.withSize(35) // меняем размер шрифта
        
        // MARK: button
        button.isHidden = true
        button.setTitle("Clear", for: .normal) // меняем заголовок кнопки
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        
        for button in actionButtons {
            button.setTitleColor(.blue, for: .normal)
            button.backgroundColor = .green
        }
    }
    
    // !!! Для того, чтобы избежатоь ошибок с названиями, можно обрахаться к кнопкам по их тэгам! Но!!!! Тэги нужно предварительно задать в Атрибьютс инспекторе во вкладке Вью

    @IBAction func pressedButton(_ sender: UIButton) {
        button.isHidden = false
        label.isHidden = false
        
//        if sender.titleLabel?.text == "Action 1" {
        if sender.tag == 0 {
            label.text = "Hello world!"
            label.textColor = .red
            
//        } else if sender.titleLabel?.text == "Action 2" {
        } else if sender.tag == 1 {
            label.text = "Hey there!"
            label.textColor = .blue
//        } else if sender.titleLabel?.text == "Button" {
        } else if sender.tag == 2 {
            label.isHidden = true
            button.isHidden = true
        } 
    }
    
}

