//
//  GamesService.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

class GamesService {
    let apiClient = URLSessionAPIClient()
    
    func games(completion: @escaping (Result<[GamesResponse], NetworkStackError>) -> Void) {
        apiClient.request(GamesAPI.games) { (result: Result<[GamesResponse], NetworkStackError>) in
            switch result {
            case .success(let gamesResponse):
                completion(.success(gamesResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func updatedGame(completion: @escaping (Result<[GamesResponse], NetworkStackError>) -> Void) {
        apiClient.request(GamesAPI.updatedGames) { (result: Result<[GamesResponse], NetworkStackError>) in
            switch result {
            case .success(let gamesResponse):
                completion(.success(gamesResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
