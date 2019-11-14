//
//  Daily.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import Foundation

struct Daily: Codable {
    var id: Int
    var time: Int
    var high: Float
    var low: Float
    var summary: String
    var uvIndex: Int
    var humidity: Float
    var icon: String
}
