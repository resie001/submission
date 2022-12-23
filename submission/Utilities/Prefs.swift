//
//  Prefs.swift
//  submission
//
//  Created by Ade Resie on 03/11/22.
//

import Foundation

class Prefs {
    private init() {}
    
    static let shared = Prefs()
    
    private let defaults = UserDefaults.standard
    
    func getName() -> String {
        return defaults.string(forKey: Constants.name) ?? Constants.nameDefault
    }
    
    func getEmail() -> String {
        return defaults.string(forKey: Constants.email) ?? Constants.emailDefault
    }
    
    func saveName(value: String, key: String) {
        defaults.setValue(value, forKey: key)
    }
}
