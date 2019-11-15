//
//  DateStringBuilder.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/15/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import Foundation

protocol StringBuilder {
    var string: String { get }
}

struct DateStringBuilder {
    let time: TimeInterval
    var string: String {
        build()
    }

    init(time: TimeInterval) {
        self.time = time
    }

    private func build() -> String {
        let date = Date(timeIntervalSince1970: time)
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
}
