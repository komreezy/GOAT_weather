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

    private let detailsHorizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.axis = .horizontal
        return stack
    }()

    private let iconImage: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35.0)
        return label
    }()

    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        return label
    }()

    private let summaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.numberOfLines = 0
        return label
    }()

    private let humidityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.numberOfLines = 0
        return label
    }()

    private let precipitationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.numberOfLines = 0
        return label
    }()

    private let uvIndexLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.numberOfLines = 0
        return label
    }()

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
        view.backgroundColor = .white
        configureDetails()

        detailsHorizontalStackView.addArrangedSubview(PaddingView(constantWidth: 8.0))
        detailsHorizontalStackView.addArrangedSubview(humidityLabel)
        detailsHorizontalStackView.addArrangedSubview(PaddingView(constantWidth: 16.0))
        detailsHorizontalStackView.addArrangedSubview(precipitationLabel)
        detailsHorizontalStackView.addArrangedSubview(PaddingView(constantWidth: 16.0))
        detailsHorizontalStackView.addArrangedSubview(uvIndexLabel)
        detailsHorizontalStackView.addArrangedSubview(PaddingView())

        view.addSubview(iconImage)
        view.addSubview(temperatureLabel)
        view.addSubview(summaryLabel)
        view.addSubview(detailsHorizontalStackView)
        NSLayoutConstraint.activate([
            iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24.0),
            iconImage.heightAnchor.constraint(equalToConstant: 55.0),
            iconImage.widthAnchor.constraint(equalToConstant: 55.0),

            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 8.0),

            summaryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            summaryLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 8.0),

            detailsHorizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24.0),
            detailsHorizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24.0),
            detailsHorizontalStackView.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 16.0),
            detailsHorizontalStackView.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }

    private func configureDetails() {
        let daily = presenter.daily
        iconImage.text = WeatherIconBuilder().iconForString(daily.icon)
        temperatureLabel.text = "H: \(daily.high)° | L: \(daily.low)°"
        summaryLabel.text = "\(daily.summary)"
        humidityLabel.text = "Humidity:\n\(daily.humidity * 100)%"
        precipitationLabel.text = "Precipitation:\n\(daily.humidity * 100)%"
        uvIndexLabel.text = "UV Index:\n\(daily.uvIndex)"
    }
}
