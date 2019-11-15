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
        HomeGateway().request(for: HomeGateway.APIRoute.forecast(lat: 34.0522, lng: 118.2437)) { (result) in
            switch result {
            case .success(let json):
                guard let week = self.parse(json: json) else { return }
                self.presenter.refreshWeather(with: week.dailies, current: week.currently)
            case .failure(let error): print(error)
            }
        }
    }

    func askUserLocationPermission() {
    }

    private func parse(json: Data) -> Dailies? {
        let decoder = JSONDecoder()

        do {
            let dailies = try decoder.decode(Dailies.self, from: json)
            print(dailies)
            return dailies
        } catch let error {
            print(error)
            return nil
        }
    }
}

extension HomeInteractorClass: UITableViewDelegate {
}
