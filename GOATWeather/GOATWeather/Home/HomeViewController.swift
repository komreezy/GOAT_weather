//
//  HomeViewController.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import UIKit
import CoreLocation

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

        guard let navigationController = navigationController else { fatalError("This HomeViewController must be embedded in a UINavigationViewController")}
        navigator = HomeNavigator(navigationController: navigationController)

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
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureNavBar()
        interactor?.startUpdatingLocation()
    }

    private func configureNavBar() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Authorize", style: .done, target: self, action: #selector(requestUserLocationPermission))
        case .denied: presenter?.presentError(with: "Please go to settings to change the location authorization services")
        case .authorizedWhenInUse, .authorizedAlways, .restricted: return
        @unknown default: fatalError("Unknown default authorization status")
        }
    }

    func refreshTableView(with current: Currently) {
        tableView.reloadData()
        header.configure(with: current)
    }

    @objc
    private func requestUserLocationPermission() {
        interactor?.askUserLocationPermission()
    }
}
