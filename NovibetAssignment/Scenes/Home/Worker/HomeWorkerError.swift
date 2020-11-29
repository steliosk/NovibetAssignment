//
//  HomeWorkerError.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 29/11/20.
//

import Foundation

enum HomeWorkerError: Error {
    case modelParsingError
}

extension HomeWorkerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .modelParsingError:
            return "Σφάλμα κατά την ανάλυση των δεδομένων"
        }
    }
}
