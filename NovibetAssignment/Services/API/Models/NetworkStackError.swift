//
//  NetworkStackError.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

enum NetworkStackError: Error {
    case noInternetConnection
    case invalidRequestObject
    case invalidResponseStatusCode(_ code: Int)
    case requestError(_ error: Error)
    case dataMissing
    case parsingError(_ error: Error, data: Data?)
}

extension NetworkStackError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "[No internet connection]"
        case .invalidRequestObject:
            return "[Invalid request object]"
        case .invalidResponseStatusCode(let statusCode):
            return "[Invalid response status code (\(statusCode))]"
        case .requestError(let error):
            return "[Request error]\n\(error.localizedDescription)"
        case .dataMissing:
            return "[Data missing]"
        case .parsingError(let error, let data):
            var description = "\(error.localizedDescription)"
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                description.append("\n\n\(responseString)")
            }
            return description
        }
    }
}
