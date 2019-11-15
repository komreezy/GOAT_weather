//
//  HomeNavigator.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import UIKit

final class HomeNavigator: Navigator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    enum Destination {
        case home
        case detail(Daily)
    }

    func route(to destination: Destination) {
        let viewController = makeViewController(for: destination)
        navigationController.pushViewController(viewController, animated: true)
    }

    private func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .home: return UIViewController()
        case .detail(let daily): return DetailViewController(navigator: self, presenter: DetailPresenterClass(daily: daily))
        }
    }
}
