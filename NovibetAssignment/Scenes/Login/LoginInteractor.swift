//
//  LoginInteractor.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//  Copyright (c) 2020 Stelios Kavouras. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {
    func login(request: Login.Login.Request)
}

protocol LoginDataStore {

}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    let loginService = LoginService()
    
    // MARK: - Do something
    
    func login(request: Login.Login.Request) {
        guard let firstName = request.firstName,
              let lastName = request.lastName,
              !firstName.isEmpty && !lastName.isEmpty
        else {
            let error = NSError(domain: "Login", code: 0, userInfo: [NSLocalizedDescriptionKey: "Both fields should be filled in order to continue"])
            let response = Login.LoginError.Response(error: error)
            self.presenter?.presentError(response: response)
            return
        }
        loginService.login(firstName: firstName, lastName: lastName) { (result) in
            switch result {
            case .success(let loginResponse):
                guard let type = loginResponse.type, let token = loginResponse.token, !type.isEmpty && !token.isEmpty else {
                    let error = NSError(domain: "Login", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid login response"])
                    let response = Login.LoginError.Response(error: error)
                    self.presenter?.presentError(response: response)
                    return
                }
                UserDefaults.set(type, forKey: Constants.type)
                UserDefaults.set(token, forKey: Constants.token)
                let response = Login.Login.Response()
                self.presenter?.presentLoginSuccess(response: response)
            case .failure(let error):
                let response = Login.LoginError.Response(error: error)
                self.presenter?.presentError(response: response)
            }
        }
    }
}
