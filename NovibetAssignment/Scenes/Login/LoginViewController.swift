//
//  LoginViewController.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//  Copyright (c) 2020 Stelios Kavouras. All rights reserved.
//

import UIKit

protocol LoginDisplayLogic: class {
    func displayLoginSuccess(viewModel: Login.Login.ViewModel)
    func displayError(viewModel: Login.LoginError.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic)?
    
    // MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }

    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Login
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        login()
    }
    
    func login() {
        let request = Login.Login.Request(firstName: firstNameTextField.text, lastName: lastNameTextField.text)
        interactor?.login(request: request)
    }
    
    // MARK: - Display logic
    
    func displayLoginSuccess(viewModel: Login.Login.ViewModel) {
        router?.routeToHome()
    }
    
    func displayError(viewModel: Login.LoginError.ViewModel) {
        displayAlert(title: viewModel.title, message: viewModel.message)
    }
}
