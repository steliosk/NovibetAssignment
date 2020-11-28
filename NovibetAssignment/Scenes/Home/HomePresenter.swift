//
//  HomePresenter.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//  Copyright (c) 2020 Stelios Kavouras. All rights reserved.
//

import UIKit

protocol HomePresentationLogic {
    func presentHeadlines(response: Home.Headlines.Response)
    func presentGames(response: Home.Games.Response)
    func presentNextHeadline(respone: Home.ScrollHeadline.Response)
    func presentError(respone: Home.HomeError.Response)
}

class HomePresenter: HomePresentationLogic {
    weak var viewController: HomeDisplayLogic?
    
    // MARK: - Presentation logic
    
    func presentHeadlines(response: Home.Headlines.Response) {
        let viewModel = Home.Headlines.ViewModel(headlines: response.headlines)
        viewController?.displayHeadlines(viewModel: viewModel)
    }
    
    func presentGames(response: Home.Games.Response) {
        let viewModel = Home.Games.ViewModel(games: response.games)
        viewController?.displayGames(viewModel: viewModel)
    }
    
    func presentNextHeadline(respone: Home.ScrollHeadline.Response) {
        let viewModel = Home.ScrollHeadline.ViewModel()
        viewController?.displayNextHeadline(viewModel: viewModel)
    }
    
    func presentError(respone: Home.HomeError.Response) {
        let viewModel = Home.HomeError.ViewModel(title: "Error", message: respone.error?.localizedDescription)
        viewController?.displayError(viewModel: viewModel)
    }
}
