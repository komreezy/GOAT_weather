//
//  HomeInteractor.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import UIKit
import CoreLocation

protocol HomeInteractor {
    var presenter: HomePresenter { get }

    func fetchWeather(lat: CLLocationDegrees, lng: CLLocationDegrees)
    func startUpdatingLocation()
    func askUserLocationPermission()
}

final class HomeInteractorClass: NSObject, HomeInteractor {
    var presenter: HomePresenter
    private let locationManager = CLLocationManager()

    init(presenter: HomePresenter) {
        self.presenter = presenter
    }

    func fetchWeather(lat: CLLocationDegrees, lng: CLLocationDegrees) {
        HomeGateway().request(for: HomeGateway.APIRoute.forecast(lat: lat, lng: lng)) { (result) in
            switch result {
            case .success(let json):
                guard let week = self.parse(json: json) else { return }
                self.presenter.refreshWeather(with: week.dailies, current: week.currently)
            case .failure(let error): print(error)
            }
        }
    }

    @objc
    func askUserLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
        startUpdatingLocation()
    }

    func startUpdatingLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.startUpdatingLocation()
        }
    }

    private func parse(json: Data) -> Dailies? {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(Dailies.self, from: json)
        } catch let error {
            print(error)
            return nil
        }
    }
}

extension HomeInteractorClass: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.showDetail(for: indexPath)
    }
}

extension HomeInteractorClass: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = manager.location?.coordinate else { return }
        fetchWeather(lat: location.latitude, lng: location.longitude)
    }
}
