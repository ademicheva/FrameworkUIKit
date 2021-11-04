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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Label
    //    label.isHidden = true //для неотмеченной First
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        
        // MARK: Segmented Control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
//        segmentedControl.selectedSegmentIndex = -1 // First будет неотмеченной в таком случае
        label.text = "First segment is selected" //  удалить для для неотмеченной First
        label.textColor = .darkGray // удалить для для неотмеченной First
        
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

