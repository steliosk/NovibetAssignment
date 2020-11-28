//
//  HomeModels.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//  Copyright (c) 2020 Stelios Kavouras. All rights reserved.
//

import UIKit

enum Home {
    
    // MARK: - Use cases
    
    enum Games {
        struct Request {
        }
        struct Response {
            var startPolling: Bool?
            var games: [Game]?
        }
        struct ViewModel {
            var games: [Game]?
        }
    }
    
    enum Headlines {
        struct Request {
        }
        struct Response {
            var startPolling: Bool?
            var startScrolling: Bool?
            var headlines: [Headline]?
        }
        struct ViewModel {
            var headlines: [Headline]?
        }
    }
    
    enum Polling {
        struct Request {
            var enable: Bool
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
    
    enum ScrollHeadline {
        struct Request {
            var enable: Bool
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
    
    enum HomeError {
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
