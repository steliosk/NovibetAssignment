//
//  HomeInteractor.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//  Copyright (c) 2020 Stelios Kavouras. All rights reserved.
//

import UIKit

protocol HomeBusinessLogic {
    func requestHeadlines(request: Home.Headlines.Request)
    func requestGames(request: Home.Games.Request)
    func requestPolling(request: Home.Polling.Request)
    func requestHeadlineScrolling(request: Home.ScrollHeadline.Request)
}

protocol HomeDataStore {

}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    var presenter: HomePresentationLogic?
    var worker = HomeWorker()
    var scrollTimer: Timer?
    var pollingTimer: Timer?
    
    // MARK: - Business logic
    
    func requestHeadlines(request: Home.Headlines.Request) {
        worker.fetchHeadlines(completion: { (result) in
            switch result {
            case .success(let headlines):
                let response = Home.Headlines.Response(headlines: headlines)
                self.presenter?.presentHeadlines(response: response)
                self.startPolling()
            case .failure(let error):
                let response = Home.HomeError.Response(error: error)
                self.presenter?.presentError(respone: response)
            }
        })
    }
    
    func requestGames(request: Home.Games.Request) {
        worker.fetchGames(completion: { (result) in
            switch result {
            case .success(let games):
                let response = Home.Games.Response(games: games)
                self.presenter?.presentGames(response: response)
                self.startPolling()
            case .failure(let error):
                let response = Home.HomeError.Response(error: error)
                self.presenter?.presentError(respone: response)
            }
        })
    }
    
    func requestPolling(request: Home.Polling.Request) {
        if request.enable {
            startPolling()
        } else {
            stopPolling()
        }
    }
    
    func requestHeadlineScrolling(request: Home.ScrollHeadline.Request) {
        if request.enable {
            startScrolling()
        } else {
            stopScrolling()
        }
    }
    
    private func requestUpdatedHeadlines() {
        worker.fetchUpdatedHeadlines(completion: { (result) in
            switch result {
            case .success(let headlines):
                let response = Home.Headlines.Response(headlines: headlines)
                self.presenter?.presentHeadlines(response: response)
                self.startScrolling()
            case .failure(let error):
                let response = Home.HomeError.Response(error: error)
                self.presenter?.presentError(respone: response)
            }
        })
    }
    
    func requestUpdatedGames() {
        worker.fetchUpdatedGames(completion: { (result) in
            switch result {
            case .success(let games):
                let response = Home.Games.Response(games: games)
                self.presenter?.presentGames(response: response)
            case .failure(let error):
                let response = Home.HomeError.Response(error: error)
                self.presenter?.presentError(respone: response)
            }
        })
    }
    
    private func startScrolling() {
        guard !(scrollTimer?.isValid ?? false) else {
            return
        }
        scrollTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { (timer) in
            let response = Home.ScrollHeadline.Response()
            self.presenter?.presentNextHeadline(respone: response)
        })
    }
    
    private func stopScrolling() {
        scrollTimer?.invalidate()
    }
    
    private func startPolling() {
        guard !(pollingTimer?.isValid ?? false) else {
            return
        }
        pollingTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { (timer) in
            self.requestUpdatedHeadlines()
            self.requestUpdatedGames()
        })
    }
    
    private func stopPolling() {
        pollingTimer?.invalidate()
    }
}
