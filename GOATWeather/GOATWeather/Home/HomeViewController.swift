//
//  HomeViewController.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    var navigator: HomeNavigator?
    var interactor: HomeInteractor?
    var presenter: HomePresenter?

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.estimatedRowHeight = 80.0
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let presenter = HomePresenterClass(viewController: self)
        self.presenter = presenter
        self.interactor = HomeInteractorClass(presenter: presenter)
    }

    func refreshTableView() {
        tableView.reloadData()
    }
}
