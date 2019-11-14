//
//  HomeInteractor.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import Foundation

protocol HomeInteractor {
    func fetchWeather()
    func askUserLocationPermission()
}

final class HomeInteractorClass: HomeInteractor {
    func fetchWeather() {
    }

    func askUserLocationPermission() {
    }
}
