//
//  ViewController.swift
//  FrameworkUIKit
//
//  Created by Алина on 03.11.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = 1 // задаем начальное значение
        // MARK: Label
    //    label.isHidden = true //для неотмеченной First
        label.text = String(slider.value)
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        // MARK: Segmented Control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
//        segmentedControl.selectedSegmentIndex = -1 // First будет неотмеченной в таком случае
        label.text = "First segment is selected" //  удалить для для неотмеченной First
        label.textColor = .darkGray // удалить для для неотмеченной First
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
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
    
}

