//
//  Views.swift
//  Calculator
//
//  Created by James on 7/21/24.
//

import UIKit

extension UITextField {
    
    static func get(placeholder: String, borderColor: UIColor, keyboard: UIKeyboardType) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.borderStyle = .none
        textField.layer.borderWidth = 1.2
        textField.layer.borderColor = borderColor.cgColor
        textField.layer.cornerRadius = 8
        textField.backgroundColor = .white
        
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor.darkGray])
        textField.clearButtonMode = .whileEditing
        textField.textColor = .black
        
        textField.keyboardType = .numbersAndPunctuation
        textField.returnKeyType = .done
        
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = leftPadding
        textField.leftViewMode = .always
        
        return textField
    }
    
}
