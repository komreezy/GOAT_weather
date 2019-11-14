//
//  WeatherIconBuilder.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import Foundation

struct WeatherIconBuilder {
    func iconForString(_ string: String) -> String {
        switch string {
        case "clear-day": return "☀️"
        case "clear-night": return "🌌"
        case "rain": return "🌧"
        case "snow": return "🌨"
        case "sleet": return "⛸"
        case "wind": return "🌬"
        case "fog": return "🌁"
        case "cloudy": return "☁️"
        case "partly-cloudy-day": return "⛅️"
        case "partly-cloudy-night": return "⛅️"
        default: return "🤷🏽‍♂️"
        }
    }
}
