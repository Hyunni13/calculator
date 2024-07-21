//
//  HomeViewModel.swift
//  Calculator
//
//  Created by James on 7/18/24.
//

import Foundation

class HomeViewModel {
    
    func logReinvestment(income optional: String?) {
        let result = self.validateIncome(income: optional)
        
        guard result.isValid else {
            print(Strings.incomeGuide)
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
        
        reinvestments.forEach { purpose, reinvestment in
            sum += reinvestment
            print("\(purpose.rawValue): \(reinvestment)")
        }
        print("====================")
        print("잔여: \(Int(result.income) - sum)")
    }
    
    private func validateIncome(income optional: String?) -> (isValid: Bool, income: Double) {
        guard let incomeString = optional else { return (false, -1) }
        guard let income = Double(incomeString) else { return (false, -1) }
        
        return (true, income)
    }
    
}
