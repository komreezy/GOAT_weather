//
//  HomePresenter.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import UIKit

protocol HomePresenter {
    var viewController: HomeViewController { get }
    var dailies: [Daily] { get set }

    func refreshWeather(with dailies: [Daily])
}

final class HomePresenterClass: NSObject, HomePresenter {
    var viewController: HomeViewController
    var dailies: [Daily] = []

    init(viewController: HomeViewController) {
        self.viewController = viewController
    }

    func refreshWeather(with dailies: [Daily]) {
        self.dailies = dailies
        viewController.refreshTableView()
    }
}

extension HomePresenterClass: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(of: UITableViewCell.self, for: indexPath)
        return cell
    }
}