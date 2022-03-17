////
////  UISettingsFile.swift
////  Delivery Service
////
////  Created by Admin on 06.03.2022.
////
//
//import Foundation
//import UIKit
//
//class ViewController: UIViewController, UITextFieldDelegate {
//
//    @IBOutlet weak var textField: UITextField!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        textField.delegate = self
//    }
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let length = !string.isEmpty ? textField.text!.count + 1 : textField.text!.count - 1
//
//        let textFieldSettings = UITextField()
//
//        textFieldSettings.clearButtonMode = .unlessEditing
//        textFieldSettings.textAlignment = .center
//
//        if length > 11 {
//            return false
//        }
//
//        return true
//    }
//}
