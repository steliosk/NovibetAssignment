//
//  LoginAPI.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

enum LoginAPI {
    case login(userName: String, password: String)
}

extension LoginAPI: EndpointTarget {
    var path: String {
        switch self {
        case .login:
            return "/5d8e4bd9310000a2612b5448"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var queryParameters: [String: String]? {
        return nil
    }
    
    var bodyParameters: [String: Any]? {
        switch self {
        case .login(let username, let password):
            return ["username": username,
                    "password": password]
        }
    }
    
    var headers: [String: String]? {
        let requestHeaders = [
            "Authorization": "\(UserDefaults.string(forKey: Constants.type) ?? "") \(UserDefaults.string(forKey: Constants.token) ?? "")",
            "Accept": "application/json"
        ]
        return requestHeaders
    }
    
    
    
}
