//
//  PaddingView.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import Foundation
import UIKit

public final class PaddingView: UIView {
    public override func didMoveToWindow() {
        backgroundColor = .clear
    }

    public init(constantWidth: CGFloat? = nil, constantHeight: CGFloat? = nil) {
        super.init(frame: .zero)

        if let width = constantWidth {
            translatesAutoresizingMaskIntoConstraints = false
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height = constantHeight {
            translatesAutoresizingMaskIntoConstraints = false
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
