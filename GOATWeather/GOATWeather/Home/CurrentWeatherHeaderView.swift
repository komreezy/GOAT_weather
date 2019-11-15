//
//  CurrentWeatherHeaderView.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/15/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import UIKit

final class CurrentWeatherHeaderView: UIView {
    private let iconView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40.0)
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32.0)
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(iconView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)

        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.topAnchor.constraint(equalTo: topAnchor, constant: 24.0),
            iconView.heightAnchor.constraint(equalToConstant: 55.0),
            iconView.widthAnchor.constraint(equalToConstant: 55.0),

            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 16.0),

            subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
            subtitleLabel.trailingAnchor.constraint(equalTo: leadingAnchor, constant: -24.0),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with current: Currently) {
        iconView.text = WeatherIconBuilder().iconForString(current.icon)
        titleLabel.text = "\(current.temperature)°"
        subtitleLabel.text = current.summary
    }
}
