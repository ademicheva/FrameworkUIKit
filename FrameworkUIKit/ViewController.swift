//
//  ViewController.swift
//  FrameworkUIKit
//
//  Created by Алина on 03.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var uiElements = [  "UISegmentedControl",
                      "label",
                      "slider",
                      "datePicker",
                      "textField"]
    
    var selectedElement: String?
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = 1 // задаем начальное значение
        
        // MARK: Label
        label.text = String(slider.value)
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        // MARK: Segmented Control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        label.text = "First segment is selected" //  удалить для для неотмеченной First
        label.textColor = .darkGray // удалить для для неотмеченной First
        
        // MARK: Slider
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        // MARK: Date
        datePicker.locale = Locale(identifier: "ru_RU")
        choiceUiElement()
    createToolbar()
    }
    
    func hideElements() {
        segmentedControl.isHidden = true
        label.isHidden = true
        slider.isHidden = true
        datePicker.isHidden = true
        
    }
    
    func choiceUiElement() {
        // тут еще нужно подписаться под протоколы (они вынесены в extension)
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        
        textField.inputView = elementPicker // вызываем это свойство для того, чтобы на экране выходила не клавиатура, а ПикерВью
        
        // Castomization
        
        elementPicker.backgroundColor = .brown
        
    }
    
    func createToolbar() {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        toolbar.setItems([doneButton], animated: true) // позволяет разместить сразу несколько объектов но в данном случае у нас он один
        toolbar.isUserInteractionEnabled = true // мы позволяем пользователю взаимодействовать с элементов
        textField.inputAccessoryView = toolbar
        
        
        // Castomization
        toolbar.tintColor = .white
        toolbar.barTintColor = .brown
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func changeSlider(_ sender: UISlider) {
        label.text = String(sender.value)
        
        let backgroundColor = self.view.backgroundColor
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sender.value)) // !!!! принимает только значения меньше 1 (от 0 до 1, например 0.4)
    }
    
    
    
    
    @IBAction func checkedSegmentedControl(_ sender: UISegmentedControl) {
        label.isHidden = false
   
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "First segment is selected"
            label.textColor = .darkGray
        case 1:
            label.text = "Second segment is selected"
            label.textColor = .blue
        case 2:
            label.text = "Third segment is selected"
            label.textColor = .purple
        default:
            break
        }
    }
    
    @IBAction func changeDate(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let dateValue = dateFormatter.string(from: sender.date)
        
        label.text = dateValue
    }
    
    
    
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    // количество барабанов, которые мы будем использовать
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // кол-во элементов, кот. будут доступны в пикервью
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return uiElements.count
    }
    
    // вытаскиваем тот или иной элемент
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uiElements[row]
    }
    
    // позволяет нам работать с выбранным елементом
    // для этого отдельно создадим в начале кода selectedElement
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedElement = uiElements[row]
        textField.text = selectedElement
        // теперь нужно создать функцию, которая будет прятать все ненужныеэлементы (она вначале)
        
        switch row {
        case 0:
            hideElements()
            segmentedControl.isHidden = false
        case 1:
            hideElements()
            label.isHidden = false
        case 2:
            hideElements()
            slider.isHidden = false
        case 3:
            hideElements()
            datePicker.isHidden = false
        default:
            hideElements()
        }
        // сделаем кнопку Done, которая позаолит скрыть нам Пикер
        
        // по сути мы пересоздаем как внешне будет выглядеть пикерсью
        func pickerView(_ pickerView: UIPickerView, viewForRow: Int, forComponent: Int, reusing view: UIView?) -> UIView {
            var pickerViewLabel = UILabel()
            
            if let currentLabel = view as? UILabel {
                pickerViewLabel = currentLabel
            } else {
                pickerViewLabel = UILabel()
            }
            pickerViewLabel.textColor = .white
            pickerViewLabel.textAlignment = .center
            pickerViewLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 23)
            pickerViewLabel.text = uiElements[row]
            
            return pickerViewLabel
            
        }
        
        
    }

}








