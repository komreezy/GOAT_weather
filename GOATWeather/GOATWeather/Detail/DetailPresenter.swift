//
//  DetailPresenter.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/15/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import Foundation

protocol DetailPresenter {
    var daily: Daily { get }
}

final class DetailPresenterClass: DetailPresenter {
    var daily: Daily

    init(daily: Daily) {
        self.daily = daily
    }
}
