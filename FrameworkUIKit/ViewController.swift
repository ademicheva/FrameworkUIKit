//
//  ViewController.swift
//  FrameworkUIKit
//
//  Created by Алина on 03.11.2021.
//

/* изначальные проблемы:
 1. Белый цвет бекграунда Текствью.
 2. Клавиатура скрывает текст.
 3. Мы не можем скрыть клавиатуру
 4. Сделаем так чтобы при вызове клавиатуры текст был белым, а при скрытии в цвет вью
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countLabel: UILabel!
    @IBOutlet var textView: UITextView!
    @IBOutlet var steppr: UIStepper!
    
//    @IBOutlet var bottomConstraint: NSLayoutConstraint! //
    
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: TextView
        
       // textView.text = ""
        
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        // http://iosfonts.com/ сайт, где представлены все шрифты
        // делаем такой же цвет шрифта как у и вью
        textView.backgroundColor = self.view.backgroundColor
        // скругляем углы
        textView.layer.cornerRadius = 10
        
        
        
        // MARK: Stepper
        steppr.value = 17 // 'то нужно устанавливать так как при нажатии на + шрифт станет 1 
        steppr.minimumValue = 10
        steppr.maximumValue = 25
        
        steppr.tintColor = .white
        steppr.backgroundColor = .gray
        steppr.layer.cornerRadius = 5
        
        
        
        // зарегистрируем 2х наблюдателей
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        //UIKeyboardWIllChangeFrame
// UIKeyboardWIllChangeFrame когда клавиатура поменяет ....
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    // метод, который будет скрывать клавиатуру по тапу за пределами Текст вью
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // метод точезБеген отслеживает тапы
        // внутри обращаюсь к вью и его свойству энд эдитинг
        // данный метод позволяет скрыть клавиатуру для любого вызванного метода
        
        
        textView.delegate = self // назаначаем наш класс делегатом ТекстВЬ/
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
        
        // textView.resignFirstResponder()
        // позволяет скрывать клавиатуру для конкретно вызванного обьекта. Для каждого вызваного обекта вызывается свой метод; то есть если несколько текстВью, то для каждого вызывается отдельно клавиатура
        // но в нашем методе всего один текствь, потому эту функцию можно не использовать
        
    }
    @objc func updateTextView(notification: Notification) {
        // проверка из словаря на возможность вытащить юзер инфо
        // keyBoardFrame присваиваю значению
        guard let userInfo = notification.userInfo as? [String: AnyObject],
        
              
        let keyBoardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        // когда клавиатура исчезает, то растояние ноль (1ый елсе)
        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyBoardFrame.height - bottomConstraint.constant, right: 0)
        }
        textView.scrollRangeToVisible(textView.selectedRange)
    }
    
    // Для того чтобы можно было менять наш цвет текствб. нужно назначить наш класс делегатом текстВью и подписаться под протокол. В этом случае будут доступны методы работы с ЮаТекстВЬю, которые будут отслеживать начало и окончание редактирования текста
    
    @IBAction func sizeFont(_ sender: UIStepper) {
        
        // создадим font, которой присвоим значение текущего шрифта
        let font = textView.font?.fontName
        
        // создадим константу, которой присвоим иазмер шрифта
        let fontSize = CGFloat(sender.value) // приводим к этому типу
        
        textView.font = UIFont(name: font!, size: fontSize)
    }
    
  

}

extension ViewController: UITextViewDelegate {
    // срабатывает при тапе на текствью
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
        textView.textColor = .gray
    }
    
    // срабатывает. когда мы тапаем за пределы нашего текст вью
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .black
    }
    
    // gjpdjkztn ddjlbnm yfv d gjkt jghtltktyyjt rjkbxtcndj cbvdjkjd
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        countLabel.text = "\(textView.text.count)"
//        return textView.text.count + (text.count - range.length) <= 60
//    }
    //range.length == backspacee
}
