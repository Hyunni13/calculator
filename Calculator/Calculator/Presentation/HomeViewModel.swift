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
            print("Income을 올바르게 입력해주세요.")
            return
        }
        
        let reinvestments = [
            "안전자산": round(result.income * 0.2),
            "위험자산": round(result.income * 0.1),
            "생활비용": round(result.income * 0.05),
            "여행자금": round(result.income * 0.05),
            "구매자금": round(result.income * 0.1)
        ]
        var sum = 0.0
        
        reinvestments.forEach { purpose, reinvestment in
            sum += reinvestment
            print("\(purpose): \(reinvestment)")
        }
        
        print("====================")
        print("잔여: \(Int(result.income - sum))")
    }
    
    private func validateIncome(income optional: String?) -> (isValid: Bool, income: Double) {
        guard let incomeString = optional else { return (false, -1) }
        guard let income = Double(incomeString) else { return (false, -1) }
        
        return (true, income)
    }
    
}
