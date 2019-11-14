//
//  HomeInteractor.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import UIKit

protocol HomeInteractor {
    var presenter: HomePresenter { get }

    func fetchWeather()
    func askUserLocationPermission()
}

final class HomeInteractorClass: NSObject, HomeInteractor {
    var presenter: HomePresenter

    init(presenter: HomePresenter) {
        self.presenter = presenter
    }

    func fetchWeather() {
        presenter.refreshWeather(with: [])
    }

    func askUserLocationPermission() {
    }
}

extension HomeInteractorClass: UITableViewDelegate {
}
