//
//  HomeView.swift
//  Calculator
//
//  Created by James on 7/21/24.
//

import UIKit

class HomeView: UIView {
    
    let incomeTextField = UITextField.get(placeholder: Strings.incomeTFPlaceholder, borderColor: .cyan, keyboard: .numberPad)
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(self.incomeTextField)
        
        self.setConstraints()
    }
    
}


extension HomeView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            self.incomeTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            self.incomeTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            self.incomeTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            self.incomeTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
