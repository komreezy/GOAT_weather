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

    private let detailsVerticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .vertical
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
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textAlignment = .center
        return label
    }()

    private let precipitationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textAlignment = .center
        return label
    }()

    private let uvIndexLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14.0)
        label.textAlignment = .center
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

        detailsVerticalStackView.addArrangedSubview(PaddingView(constantWidth: 8.0))
        detailsVerticalStackView.addArrangedSubview(humidityLabel)
        detailsVerticalStackView.addArrangedSubview(PaddingView())
        detailsVerticalStackView.addArrangedSubview(precipitationLabel)
        detailsVerticalStackView.addArrangedSubview(PaddingView())
        detailsVerticalStackView.addArrangedSubview(uvIndexLabel)
        detailsVerticalStackView.addArrangedSubview(PaddingView())

        view.addSubview(iconImage)
        view.addSubview(temperatureLabel)
        view.addSubview(summaryLabel)
        view.addSubview(detailsVerticalStackView)
        NSLayoutConstraint.activate([
            iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24.0),
            iconImage.heightAnchor.constraint(equalToConstant: 55.0),
            iconImage.widthAnchor.constraint(equalToConstant: 55.0),

            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 8.0),

            summaryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            summaryLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 8.0),

            detailsVerticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24.0),
            detailsVerticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24.0),
            detailsVerticalStackView.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 16.0),
            detailsVerticalStackView.heightAnchor.constraint(greaterThanOrEqualToConstant: 40.0),
        ])
    }

    private func configureDetails() {
        let daily = presenter.daily
        title = DateStringBuilder(time: Double(daily.time)).string
        iconImage.text = WeatherIconBuilder().iconForString(daily.icon)
        temperatureLabel.text = "H: \(daily.high)° | L: \(daily.low)°"
        summaryLabel.text = "\(daily.summary)"
        humidityLabel.text = "Humidity: \(daily.humidity * 100)%"
        precipitationLabel.text = "Precipitation: \(daily.precipProbability * 100)%"
        uvIndexLabel.text = "UV Index: \(daily.uvIndex)"
    }
}
