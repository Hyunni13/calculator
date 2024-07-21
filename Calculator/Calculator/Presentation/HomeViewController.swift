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


// MARK: UITextField
extension HomeViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard let incomeString = textField.text else { return }
        textField.text = String(incomeString.dropLast())
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let incomeString = textField.text else { return true }
        let updatedIncomeString = (incomeString as NSString).replacingCharacters(in: range, with: string)
        
        guard let income = Int(updatedIncomeString.replacingOccurrences(of: ",", with: "")) else { return true }
        textField.text = income.decimalFormatted
        
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let incomeString = textField.text, !incomeString.isEmpty else { return }
        textField.text = incomeString + "원"
        
        let cleanedIncomeString = incomeString.replacingOccurrences(of: ",", with: "")
        self.viewModel.suggestReinvestment(income: cleanedIncomeString) { suggestion in
            let mainView = view as! HomeView
            mainView.suggestionLabel.text = suggestion
        }
    }
    
}
