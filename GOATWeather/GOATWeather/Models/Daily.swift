//
//  Daily.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import Foundation

struct Dailies: Codable {
    var currently: Currently
    var dailies: [Daily]

    enum CodingKeys: String, CodingKey {
        case daily
        case data
        case currently
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let daily = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .daily)
        dailies = try daily.decode([Daily].self, forKey: .data)
        currently = try container.decode(Currently.self, forKey: .currently)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(currently, forKey: .currently)
        var daily = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .daily)
        try daily.encode(dailies, forKey: .data)
    }
}

struct Currently: Codable {
    var time: Int
    var temperature: Int
    var summary: String
    var precipProbability: Float
    var uvIndex: Int
    var humidity: Float
    var icon: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        time = try container.decode(Int.self, forKey: .time)
        temperature = Int(try container.decode(Float.self, forKey: .temperature))
        summary = try container.decode(String.self, forKey: .summary)
        precipProbability = try container.decode(Float.self, forKey: .precipProbability)
        uvIndex = try container.decode(Int.self, forKey: .uvIndex)
        humidity = try container.decode(Float.self, forKey: .humidity)
        icon = try container.decode(String.self, forKey: .icon)
    }
}

struct Daily: Codable {
    var time: Int
    var high: Int
    var low: Int
    var summary: String
    var precipProbability: Float
    var uvIndex: Int
    var humidity: Float
    var icon: String

    enum CodingKeys: String, CodingKey {
        case time
        case high = "temperatureHigh"
        case low = "temperatureLow"
        case summary
        case precipProbability
        case uvIndex
        case humidity
        case icon
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        time = try container.decode(Int.self, forKey: .time)
        high = Int(try container.decode(Float.self, forKey: .high))
        low = Int(try container.decode(Float.self, forKey: .low))
        summary = try container.decode(String.self, forKey: .summary)
        precipProbability = try container.decode(Float.self, forKey: .precipProbability)
        uvIndex = try container.decode(Int.self, forKey: .uvIndex)
        humidity = try container.decode(Float.self, forKey: .humidity)
        icon = try container.decode(String.self, forKey: .icon)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(time, forKey: .time)
        try container.encode(high, forKey: .high)
        try container.encode(low, forKey: .low)
        try container.encode(precipProbability, forKey: .precipProbability)
        try container.encode(summary, forKey: .summary)
        try container.encode(uvIndex, forKey: .uvIndex)
        try container.encode(humidity, forKey: .humidity)
        try container.encode(icon, forKey: .icon)
    }
}
