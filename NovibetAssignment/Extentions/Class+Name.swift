//
//  Class+Name.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 28/11/20.
//
import Foundation

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
    
}
