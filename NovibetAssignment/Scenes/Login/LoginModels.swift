//
//  LoginModels.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//  Copyright (c) 2020 Stelios Kavouras. All rights reserved.
//

import UIKit

enum Login {
        
    // MARK: - Use cases
    
    enum Login {
        struct Request {
            var userName: String?
            var password: String?
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
    
    enum LoginError {
        struct Request {
        }
        struct Response {
            var error: Error?
        }
        struct ViewModel {
            var title: String?
            var message: String?
        }
    }
}
