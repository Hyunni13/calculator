//
//  IntExtension.swift
//  Calculator
//
//  Created by James on 7/21/24.
//

import Foundation

extension Int {
    
    var decimalFormat: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        return formatter.string(from: NSNumber(value: self))
    }
    
}
