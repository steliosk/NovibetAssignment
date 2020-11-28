//
//  HeadlinesAPI.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

enum HeadlinesAPI {
    case headlines
    case updatedHeadlines
}

extension HeadlinesAPI: EndpointTarget {
    var path: String {
        switch self {
        case .headlines:
            return "/5d7113ef3300000e00779746"
        case .updatedHeadlines:
            return "/5d711461330000d135779748"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var queryParameters: [String : String]? {
        return nil
    }
    
    var bodyParameters: [String : Any]? {
        return nil
    }
    
    var headers: [String: String]? {
        let requestHeaders = [
            "Authorization": "\(UserDefaults.string(forKey: Constants.type) ?? "") \(UserDefaults.string(forKey: Constants.token) ?? "")",
            "Accept": "application/json"
        ]
        return requestHeaders
    }
}
