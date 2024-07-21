//
//  IntExtension.swift
//  Calculator
//
//  Created by James on 7/21/24.
//

import Foundation

extension Int {
    
    var decimalFormatted: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        return formatter.string(from: NSNumber(value: self))
    }
    
    func formatDeciaml(defaults: String = "") -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        return formatter.string(from: NSNumber(value: self)) ?? defaults
    }
    
}
