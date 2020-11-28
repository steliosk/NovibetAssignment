//
//  Parser.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

protocol Parser {
    func parse<T: Decodable>(_ data: Data, type: T.Type) throws -> T
}
