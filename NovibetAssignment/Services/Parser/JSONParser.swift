//
//  JSONParser.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

class JSONParser: Parser {
    let jsonDecoder = JSONDecoder()

    func parse<T: Decodable>(_ data: Data, type: T.Type) throws -> T {
        return try jsonDecoder.decode(T.self, from: data)
    }
}
