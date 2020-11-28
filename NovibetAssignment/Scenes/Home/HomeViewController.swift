//
//  HomeViewController.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//  Copyright (c) 2020 Stelios Kavouras. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: class {
    func displayHeadlines(viewModel: Home.Headlines.ViewModel)
    func displayGames(viewModel: Home.Games.ViewModel)
    func displayNextHeadline(viewModel: Home.ScrollHeadline.ViewModel)
    func displayError(viewModel: Home.HomeError.ViewModel)
}

class HomeViewController: UIViewController, HomeDisplayLogic, UITableViewDataSource {
    var interactor: HomeBusinessLogic?
    var games: [Game]?
    var headlines: [Headline]?
    // MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    // MARK: - Configuration
    
    private func configure() {
        tableView.dataSource = self
    }
    
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        getData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopRepeatedProcesses()
    }
    
    // MARK: - TableView
    
    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return games?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HeadlineTableViewCell.className, for: indexPath) as! HeadlineTableViewCell
            cell.configure(headlines: headlines)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.className, for: indexPath) as! GameTableViewCell
        cell.confirgure(game: games?[indexPath.row])
        return cell
    }
    
    // MARK: - Actions
    
    func getData() {
        getHeadlines()
        getGames()
    }
    
    func getHeadlines() {
        let request = Home.Headlines.Request()
        interactor?.requestHeadlines(request: request)
    }
    
    func getGames() {
        let request = Home.Games.Request()
        interactor?.requestGames(request: request)
    }
    
    func stopRepeatedProcesses() {
        let pollingRequest = Home.Polling.Request(enable: false)
        interactor?.requestPolling(request: pollingRequest)
        
        let scrollingRequest = Home.ScrollHeadline.Request(enable: false)
        interactor?.requestHeadlineScrolling(request: scrollingRequest)
    }
    
    // MARK: - Display logic
    
    func displayHeadlines(viewModel: Home.Headlines.ViewModel) {
        headlines = viewModel.headlines
        tableView.reloadData()
    }
    
    func displayGames(viewModel: Home.Games.ViewModel) {
        games = viewModel.games
        tableView.reloadData()
    }
    
    func displayNextHeadline(viewModel: Home.ScrollHeadline.ViewModel) {
        if let headlineCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? HeadlineTableViewCell {
            headlineCell.scrollToNextheadline()
        }
    }

    func displayError(viewModel: Home.HomeError.ViewModel) {
        displayAlert(title: viewModel.title, message: viewModel.message)
    }
    
}
