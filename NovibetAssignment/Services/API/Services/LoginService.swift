//
//  LoginService.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

class LoginService {
    let apiClient = URLSessionAPIClient()
    
    func login(firstName: String, lastName: String, completion: @escaping (Result<LoginResponse, NetworkStackError>) -> Void) {
        apiClient.request(LoginAPI.login(firstName: firstName, lastName: lastName)) { (result: Result<LoginResponse, NetworkStackError>) in
            switch result {
            case .success(let loginResponse):
                completion(.success(loginResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
