//
//  ViewController.swift
//  UITextFieldInDeep
//
//  Created by eduardo fulgencio on 15/08/2019.
//  Copyright © 2019 Eduardo Fulgencio Comendeiro. All rights reserved.
//

import UIKit

class TextFieldVC: UIViewController {

    var nameTextField = UITextField()
    var iconTextField: UITextField! {
        didSet {
            iconTextField.tintColor = UIColor.lightGray
          //  iconTextField.setIcon(imageLiteral(resourceName: "icon-user"))
        }
    }
    
    override func viewDidLoad() {
        
        let redBox = UIView(frame: CGRect(x: 100, y: 100, width: 128, height: 128))
        redBox.backgroundColor = .red
        redBox.layer.cornerRadius = 25
        // hace las esquinas diferentes
        redBox.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        view.addSubview(redBox)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        nameTextField = UITextField(frame:CGRect(x: 40, y: 44 , width: 200 , height: 32))
        nameTextField.textAlignment = NSTextAlignment.center
        
        self.view.addSubview(nameTextField)
        
        nameTextField.placeholder = "Email"
        nameTextField.layer.borderWidth = 1
        nameTextField.textColor = UIColor.black
        nameTextField.layer.cornerRadius = 2.0
        nameTextField.becomeFirstResponder()
        
       // nameTextField.delegate = self
        nameTextField.addTarget(self, action: #selector(editingChanged(sender:)), for: .editingChanged)
        
        nameTextField.clearButtonMode = .whileEditing
        
        nameTextField.keyboardType = UIKeyboardType.namePhonePad
    }
    
    @objc private func editingChanged(sender: UITextField) {
        if let text = sender.text, text.count >= 4 {
            sender.text = String(text.dropLast(text.count - 4))
            return
        }
    }

}

extension TextFieldVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = (textField.text?.utf16.count)! + string.utf16.count - range.length
        if newLength <= 4 {
            return true
        } else {
            return false
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}






