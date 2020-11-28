//
//  AppDelegate.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if SessionWorker.isUserLoggedIn {
            let sb = UIStoryboard(name: "Home", bundle: nil)
            if let vc = sb.instantiateInitialViewController(){
                window?.rootViewController = vc
            }
        }

        return true
    }

}

