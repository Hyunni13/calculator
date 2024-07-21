//
//  UserDefaultsManager.swift
//  Calculator
//
//  Created by James on 7/21/24.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private let storage = UserDefaults.standard
    
    private init() { }
    
    func get(key: Reinvestment) -> Any? {
        return self.storage.object(forKey: key.rawValue)
    }
    
    func set(key: Reinvestment, value: Any?) {
        self.storage.set(value, forKey: key.rawValue)
    }
    
    func register(defaults: [Reinvestment: Int]) {
        DispatchQueue.global().async {
            defaults.forEach { key, value in
                if self.get(key: key) == nil {
                    self.set(key: key, value: value)
                }
            }
        }
    }
    
}
