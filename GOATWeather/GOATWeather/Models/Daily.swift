//
//  Daily.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import Foundation

struct Daily: Codable {
    var time: Int
    var high: Float
    var low: Float
    var summary: String
    var uvIndex: Int
    var humidity: Float
    var icon: String

    enum CodingKeys: String, CodingKey {
        case daily
        case data
        case time
        case high = "temperatureHigh"
        case low = "temperatureLow"
        case summary
        case uvIndex
        case humidity
        case icon
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let daily = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .daily)
        let data = try daily.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        time = try data.decode(Int.self, forKey: .time)
        high = try data.decode(Float.self, forKey: .high)
        low = try data.decode(Float.self, forKey: .low)
        summary = try data.decode(String.self, forKey: .summary)
        uvIndex = try data.decode(Int.self, forKey: .uvIndex)
        humidity = try data.decode(Float.self, forKey: .humidity)
        icon = try data.decode(String.self, forKey: .icon)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var daily = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .daily)
        var data = daily.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        try data.encode(time, forKey: .time)
        try data.encode(high, forKey: .high)
        try data.encode(low, forKey: .low)
        try data.encode(summary, forKey: .summary)
        try data.encode(uvIndex, forKey: .uvIndex)
        try data.encode(humidity, forKey: .humidity)
        try data.encode(icon, forKey: .icon)
    }
}
