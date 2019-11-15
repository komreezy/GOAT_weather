//
//  HomeViewController.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    var navigator: HomeNavigator?
    var interactor: HomeInteractor?
    var presenter: HomePresenter?
    let header: CurrentWeatherHeaderView = {
        let view = CurrentWeatherHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.estimatedRowHeight = 80.0
        table.rowHeight = UITableView.automaticDimension
        table.register(cell: HomeTableViewCell.self)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let presenter = HomePresenterClass(viewController: self)
        self.presenter = presenter
        tableView.dataSource = presenter

        let interactor = HomeInteractorClass(presenter: presenter)
        self.interactor = interactor
        tableView.delegate = interactor

        view.backgroundColor = .white
        view.addSubview(header)
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.heightAnchor.constraint(equalToConstant: 185.0),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: header.bottomAnchor),
        ])

        HomeGateway().request(for: HomeGateway.APIRoute.forecast(lat: 34.0522, lng: 118.2437)) { (result) in
            switch result {
            case .success(let json): self.parse(json: json)
            case .failure(let error): print(error)
            }
        }
    }

    func refreshTableView() {
        header.configure(with: presenter!.dailies[0])
        tableView.reloadData()
    }

    func parse(json: Data) {
        let decoder = JSONDecoder()

        do {
            let jsonPetitions = try decoder.decode(Dailies.self, from: json)
            print(jsonPetitions)
        } catch let error {
            print(error)
        }
    }
}
