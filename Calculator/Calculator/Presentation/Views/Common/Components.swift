//
//  Views.swift
//  Calculator
//
//  Created by James on 7/21/24.
//

import UIKit

extension UILabel {
    
    static func get(text: String? = nil) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.numberOfLines = 0
        label.textColor = .black
        label.text = text
        
        return label
    }
    
}


extension UITextField {
    
    static func get(placeholder: String, borderColor: UIColor, keyboard: UIKeyboardType) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.borderStyle = .none
        textField.layer.borderWidth = 1.2
        textField.layer.borderColor = borderColor.cgColor
        textField.layer.cornerRadius = 8
        textField.backgroundColor = .white
        
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder, attributes: [.foregroundColor: UIColor.darkGray]
        )
        textField.textColor = .black
        
        textField.keyboardType = keyboard
        textField.returnKeyType = .done
        
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = leftPadding
        textField.leftViewMode = .always
        
        return textField
    }
    
}
