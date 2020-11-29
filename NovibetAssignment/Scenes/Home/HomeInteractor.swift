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

class HomeInteractor: HomeBusinessLogic {
    var presenter: HomePresentationLogic?
    var worker = HomeWorker()
    var scrollTimer: Timer?
    var pollingTimer: Timer?
    
    let pollingTimeInterval: TimeInterval = 2
    let healineScrollingTimeInterval: TimeInterval = 5
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
            startScrollingHeadlines()
        } else {
            stopScrollingHeadlines()
        }
    }
    
    // MARK: - Updated items
    
    private func requestUpdatedHeadlines() {
        worker.fetchUpdatedHeadlines(completion: { (result) in
            switch result {
            case .success(let headlines):
                let response = Home.Headlines.Response(headlines: headlines)
                self.presenter?.presentHeadlines(response: response)
                if (headlines?.count ?? 0) > 1 {
                    self.startScrollingHeadlines()
                } else {
                    self.stopScrollingHeadlines()
                }
            case .failure(let error):
                let response = Home.HomeError.Response(error: error)
                self.presenter?.presentError(respone: response)
            }
        })
    }
    
    private func requestUpdatedGames() {
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
    
    // MARK: - Timers
    
    private func startScrollingHeadlines() {
        guard !(scrollTimer?.isValid ?? false) else {
            return
        }
        scrollTimer = Timer.scheduledTimer(withTimeInterval: healineScrollingTimeInterval, repeats: true, block: { (timer) in
            let response = Home.ScrollHeadline.Response()
            self.presenter?.presentNextHeadline(respone: response)
        })
    }
    
    private func stopScrollingHeadlines() {
        scrollTimer?.invalidate()
    }
    
    private func startPolling() {
        guard !(pollingTimer?.isValid ?? false) else {
            return
        }
        pollingTimer = Timer.scheduledTimer(withTimeInterval: pollingTimeInterval, repeats: true, block: { (timer) in
            self.requestUpdatedHeadlines()
            self.requestUpdatedGames()
        })
    }
    
    private func stopPolling() {
        pollingTimer?.invalidate()
    }
}
