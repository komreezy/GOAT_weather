//
//  Navigator.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import UIKit

protocol Navigator {
    associatedtype Destination
    var navigationController: UINavigationController { get }

    func route(to destination: Destination)
}
