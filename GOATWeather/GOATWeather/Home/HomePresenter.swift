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
    var title: String? { get set }

    func refreshWeather(with dailies: [Daily], current: Currently)
    func showDetail(for index: IndexPath)
    func updateTitle(_ title: String?)
    func presentError(with description: String)
}

final class HomePresenterClass: NSObject, HomePresenter {
    var viewController: HomeViewController
    var dailies: [Daily] = []
    var title: String?

    init(viewController: HomeViewController) {
        self.viewController = viewController
    }

    func refreshWeather(with dailies: [Daily], current: Currently) {
        self.dailies = dailies
        if !dailies.isEmpty {
            viewController.navigationItem.rightBarButtonItem = nil
        }
        viewController.refreshTableView(with: current)
    }

    func showDetail(for index: IndexPath) {
        let daily = dailies[index.row]
        viewController.navigator?.route(to: .detail(daily))
    }

    func updateTitle(_ title: String?) {
        viewController.title = title
    }

    func presentError(with description: String) {
        let alert = UIAlertController(title: "Error", message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}

extension HomePresenterClass: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(of: HomeTableViewCell.self, for: indexPath)
        cell.configure(with: dailies[indexPath.row])
        return cell
    }
}
