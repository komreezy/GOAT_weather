//
//  HomePresenter.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import Foundation

protocol HomePresenter {
    var dailies: [Daily] { get set }

    func refreshWeather()
}

final class HomePresenterClass: HomePresenter {
    var dailies: [Daily] = []

    func refreshWeather() {
    }
}
