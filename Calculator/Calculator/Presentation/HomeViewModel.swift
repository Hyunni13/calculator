//
//  HomeViewModel.swift
//  Calculator
//
//  Created by James on 7/18/24.
//

import Foundation

class HomeViewModel {
    
    func suggestReinvestment(income optional: String?, completion: (String) -> Void) {
        let result = self.validateIncome(income: optional)
        
        guard result.isValid else {
            completion(Strings.incomeGuide)
            return
        }
        
        let reinvestments: KeyValuePairs<Reinvestment, Int> = [
            .safeAssets: Int(round(result.income * 0.2)),
            .riskAssets: Int(round(result.income * 0.1)),
            .livingBudget: Int(round(result.income * 0.05)),
            .tripBudget: Int(round(result.income * 0.1)),
            .purchaseBudget: Int(round(result.income * 0.05))
        ]
        var sum = 0
        var components = [String]()
        
        reinvestments.forEach { purpose, reinvestment in
            sum += reinvestment
            components.append("\(purpose.rawValue): \(reinvestment.formatDeciaml())")
        }
        components.append("====================")
        components.append("잔여: \((Int(result.income) - sum).formatDeciaml())")
        
        completion(components.joined(separator: "\n"))
    }
    
    private func validateIncome(income optional: String?) -> (isValid: Bool, income: Double) {
        guard let incomeString = optional else { return (false, -1) }
        guard let income = Double(incomeString) else { return (false, -1) }
        
        return (true, income)
    }
    
}
