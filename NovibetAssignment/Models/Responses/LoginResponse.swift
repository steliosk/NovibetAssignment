//
//  LoginResponse.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

struct LoginResponse: Codable {
    var token: String?
    var type: String?
    
    private enum CodingKeys: String, CodingKey {
        case token = "access_token"
        case type = "token_type"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        token = try container.decode(String.self, forKey: .token)
        type = try container.decode(String.self, forKey: .type)
    }
    
}
