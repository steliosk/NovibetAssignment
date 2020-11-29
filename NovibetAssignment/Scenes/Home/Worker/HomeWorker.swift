//
//  HomeWorker.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//  Copyright (c) 2020 Stelios Kavouras. All rights reserved.
//

import UIKit

class HomeWorker {
    let gamesService = GamesService()
    let headlinesService = HeadlinesService()
    
    func fetchGames(completion: @escaping (Result<[Game]?,Error>) -> Void) {
        gamesService.games { (result) in
            switch result {
            case .success(let gamesResponse):
                guard let games = self.parse(gamesResponses: gamesResponse) else {
                    completion(.failure(HomeWorkerError.modelParsingError))
                    return
                }
                completion(.success(games))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchUpdatedGames(completion: @escaping (Result<[Game]?,Error>) -> Void) {
        gamesService.updatedGame { (result) in
            switch result {
            case .success(let gamesResponse):
                guard let games = self.parse(gamesResponses: gamesResponse) else {
                    completion(.failure(HomeWorkerError.modelParsingError))
                    return
                }
                completion(.success(games))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchHeadlines(completion: @escaping (Result<[Headline]?,Error>) -> Void) {
        headlinesService.headlines { (result) in
            switch result {
            case .success(let headlineResponses):
                guard let games = self.parse(headlineResponses: headlineResponses) else {
                    completion(.failure(HomeWorkerError.modelParsingError))
                    return
                }
                completion(.success(games))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchUpdatedHeadlines(completion: @escaping (Result<[Headline]?,Error>) -> Void) {
        headlinesService.updatedHeadLines { (result) in
            switch result {
            case .success(let headlineResponses):
                guard let games = self.parse(headlineResponses: headlineResponses) else {
                    completion(.failure(HomeWorkerError.modelParsingError))
                    return
                }
                completion(.success(games))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Parsing
    
    private func parse(gamesResponses: [GamesResponse]) -> [Game]? {
        guard let competitions = gamesResponses.first?.betViews?.first?.competitions else {
            return nil
        }
        
        let games = competitions.compactMap { (competition) -> [Game]? in
            return competition.events?.compactMap({Game(event: $0)})
        }
        return games.flatMap({ $0 })
    }
    
    private func parse(headlineResponses: [HeadlinesResponse]) -> [Headline]? {
        guard let headlines = headlineResponses.first?.betViews?.compactMap({Headline(betView: $0)}) else {
            return nil
        }
        let filteredHeadlines = headlines.compactMap({ (headline) -> Headline? in
            guard headline.competitor1Caption != nil && headline.competitor1Caption != nil else {
                return nil
            }
            return headline
        })
        return filteredHeadlines
    }
}
