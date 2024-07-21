//
//  HomeViewController.swift
//  Calculator
//
//  Created by James on 7/17/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel()

    override func loadView() {
        super.loadView()
        
        view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.delegate()
        self.addGestures()
    }
    
    private func delegate() {
        let mainView = view as! HomeView
        mainView.incomeTextField.delegate = self
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
