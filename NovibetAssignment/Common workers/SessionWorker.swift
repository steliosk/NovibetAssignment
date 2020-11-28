//
//  SessionWorker.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//  Copyright (c) 2020 Stelios Kavouras. All rights reserved.
//

import UIKit

class SessionWorker {
    
    static var isUserLoggedIn: Bool {
        return UserDefaults.string(forKey: Constants.type) != nil && UserDefaults.string(forKey: Constants.token) != nil
    }
    
}
