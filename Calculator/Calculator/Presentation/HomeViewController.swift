//
//  HomeViewController.swift
//  Calculator
//
//  Created by James on 7/17/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    private let incomeTextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.borderStyle = .none
        textField.layer.borderWidth = 1.2
        textField.layer.borderColor = UIColor.cyan.cgColor
        textField.layer.cornerRadius = 8
        textField.backgroundColor = .white
        
        textField.attributedPlaceholder = NSAttributedString(string: Strings.incomeTFPlaceholder, attributes: [.foregroundColor: UIColor.darkGray])
        textField.clearButtonMode = .whileEditing
        textField.textColor = .black
        
        textField.keyboardType = .numbersAndPunctuation
        textField.returnKeyType = .done
        
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = leftPadding
        textField.leftViewMode = .always
        
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(self.incomeTextField)
        
        self.setConstraints()
        self.addGestures()
        
        self.incomeTextField.delegate = self
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            self.incomeTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.incomeTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            self.incomeTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            self.incomeTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
}


extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.viewModel.logReinvestment(income: textField.text)
        
        return true
    }
    
}
