//
//  HeadlinesService.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

class HeadlinesService {
    let apiClient = URLSessionAPIClient()

    func headlines(completion: @escaping (Result<[HeadlinesResponse], NetworkStackError>) -> Void) {
        apiClient.request(HeadlinesAPI.headlines) { (result: Result<[HeadlinesResponse], NetworkStackError>) in
            switch result {
            case .success(let headlinesResponse):
                completion(.success(headlinesResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func updatedHeadlines(completion: @escaping (Result<[HeadlinesResponse], NetworkStackError>) -> Void) {
        apiClient.request(HeadlinesAPI.updatedHeadlines) { (result: Result<[HeadlinesResponse], NetworkStackError>) in
            switch result {
            case .success(let headlinesResponse):
                completion(.success(headlinesResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
