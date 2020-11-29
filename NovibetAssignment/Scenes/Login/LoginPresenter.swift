//
//  LoginPresenter.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//  Copyright (c) 2020 Stelios Kavouras. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic {
    func presentLoginSuccess(response: Login.Login.Response)
    func presentError(response: Login.LoginError.Response)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    
    // MARK: - Presentation logic
    
    func presentLoginSuccess(response: Login.Login.Response) {
        let viewModel = Login.Login.ViewModel()
        viewController?.displayLoginSuccess(viewModel: viewModel)
    }
    
    func presentError(response: Login.LoginError.Response) {
        let viewModel = Login.LoginError.ViewModel(title: " Σφάλμα", message: response.error?.localizedDescription)
        viewController?.displayError(viewModel: viewModel)
    }
    
}
