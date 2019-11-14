//
//  HomeViewController.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    var navigator: HomeNavigator {
        guard let navigationController = navigationController else {
            fatalError("HomeViewController must be initialized with a navigation controller")
        }
        return HomeNavigator(navigationController: navigationController)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
}
