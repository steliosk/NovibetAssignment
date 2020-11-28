//
//  UserDefaults+AppAdditions.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

extension UserDefaults {
        
    static func set(_ value: String, forKey key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func string(forKey key: String) -> String? {
        return UserDefaults.standard.string(forKey: key)
    }

}
