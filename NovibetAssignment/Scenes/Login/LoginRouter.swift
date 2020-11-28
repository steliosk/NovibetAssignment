//
//  LoginRouter.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//  Copyright (c) 2020 Stelios Kavouras. All rights reserved.
//

import UIKit

@objc protocol LoginRoutingLogic {
    func routeToHome()
}

class LoginRouter: NSObject, LoginRoutingLogic {
    weak var viewController: LoginViewController?
    
    // MARK: - Routing
    
    func routeToHome() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigateToHome(source: viewController, destination: destinationVC)
    }
    
    // MARK: - Navigation
    
    func navigateToHome(source: LoginViewController?, destination: HomeViewController) {
        source?.show(destination, sender: nil)
    }

}
