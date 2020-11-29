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

class LoginInteractor: LoginBusinessLogic {
    var presenter: LoginPresentationLogic?
    let loginService = LoginService()
    
    // MARK: - BusinessLogic
    
    func login(request: Login.Login.Request) {
        guard let firstName = request.firstName,
              let lastName = request.lastName,
              !firstName.isEmpty && !lastName.isEmpty
        else {
            let error = NSError(domain: "Σύνδεση", code: 0, userInfo: [NSLocalizedDescriptionKey: "Θα πρέπει να είναι και τα 2 πεδία συμπληρωμένα για να συνεχίσετε"])
            let response = Login.LoginError.Response(error: error)
            self.presenter?.presentError(response: response)
            return
        }
        loginService.login(firstName: firstName, lastName: lastName) { (result) in
            switch result {
            case .success(let loginResponse):
                guard let type = loginResponse.type, let token = loginResponse.token, !type.isEmpty && !token.isEmpty else {
                    let error = NSError(domain: "Σύνδεση", code: 0, userInfo: [NSLocalizedDescriptionKey: "Κάτι πήγε λάθος στην προσπάθεια σύνσδεσης"])
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
