//
//  LoginService.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

class LoginService {
    let apiClient = URLSessionAPIClient()
    
    func login(userName: String, password: String, completion: @escaping (Result<LoginResponse, NetworkStackError>) -> Void) {
        apiClient.request(LoginAPI.login(userName: userName, password: password)) { (result: Result<LoginResponse, NetworkStackError>) in
            switch result {
            case .success(let loginResponse):
                completion(.success(loginResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
