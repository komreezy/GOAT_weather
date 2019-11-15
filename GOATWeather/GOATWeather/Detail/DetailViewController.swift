//
//  DetailViewController.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    private let navigator: HomeNavigator
    private let presenter: DetailPresenter

    init(navigator: HomeNavigator, presenter: DetailPresenterClass) {
        self.navigator = navigator
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}
