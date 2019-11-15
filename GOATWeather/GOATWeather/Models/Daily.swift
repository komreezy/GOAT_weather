//
//  Daily.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import Foundation

struct Dailies: Codable {
    var dailies: [Daily]

    enum CodingKeys: String, CodingKey {
        case daily
        case data
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let daily = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .daily)
        dailies = try daily.decode([Daily].self, forKey: .data)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var daily = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .daily)
        try daily.encode(dailies, forKey: .data)
    }
}

struct Daily: Codable {
    var time: Int
    var high: Float
    var low: Float
    var summary: String
    var uvIndex: Int
    var humidity: Float
    var icon: String

    enum CodingKeys: String, CodingKey {
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
        time = try container.decode(Int.self, forKey: .time)
        high = try container.decode(Float.self, forKey: .high)
        low = try container.decode(Float.self, forKey: .low)
        summary = try container.decode(String.self, forKey: .summary)
        uvIndex = try container.decode(Int.self, forKey: .uvIndex)
        humidity = try container.decode(Float.self, forKey: .humidity)
        icon = try container.decode(String.self, forKey: .icon)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(time, forKey: .time)
        try container.encode(high, forKey: .high)
        try container.encode(low, forKey: .low)
        try container.encode(summary, forKey: .summary)
        try container.encode(uvIndex, forKey: .uvIndex)
        try container.encode(humidity, forKey: .humidity)
        try container.encode(icon, forKey: .icon)
    }
}
