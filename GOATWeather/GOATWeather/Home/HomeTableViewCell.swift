//
//  HomeTableViewCell.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    private let horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .horizontal
        return stack
    }()

    private let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .vertical
        return stack
    }()

    private let iconImage: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 35.0)
        label.text = "☀️"
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.text = "Summary"
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = .lightGray
        label.text = "skdjfhskdjhf mhgcnhgfxdbfdz"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(PaddingView(constantWidth: 8.0))
        horizontalStackView.addArrangedSubview(iconImage)
        horizontalStackView.addArrangedSubview(PaddingView(constantWidth: 8.0))
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(PaddingView())
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleLabel)
        verticalStackView.addArrangedSubview(PaddingView())

        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
