//
//  APIEnvironment.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

enum APIEnvironment: String {
    case mocky
    
    var name: String {
        return String(describing: self)
    }
    
    var host: String {
        return "\(name).io"
    }
    
    static var current: APIEnvironment {
        return .mocky
    }
}
