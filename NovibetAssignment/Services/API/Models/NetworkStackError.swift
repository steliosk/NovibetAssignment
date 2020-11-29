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
            return "[Δεν υπάρχει σύνδεση στο διαδίκτυο]"
        case .invalidRequestObject:
            return "[Ελλιπής κλήση]"
        case .invalidResponseStatusCode(let statusCode):
            return "[Λανθασμένος κωδικός απάντησης HTTP (\(statusCode))]"
        case .requestError(let error):
            return "[Σφάλμα κλήσης]\n\(error.localizedDescription)"
        case .dataMissing:
            return "[Ελλιπή δεδομένα]"
        case .parsingError(let error, let data):
            var description = "\(error.localizedDescription)"
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                description.append("\n\n\(responseString)")
            }
            return description
        }
    }
}
