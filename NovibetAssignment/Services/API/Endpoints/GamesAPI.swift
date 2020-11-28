//
//  GamesAPI.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

enum GamesAPI {
    case games
    case updatedGames
}

extension GamesAPI: EndpointTarget {
    var path: String {
        switch self {
        case .games:
            return "/5d7113513300000b2177973a"
        case .updatedGames:
            return "/5d7114b2330000112177974d"
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
