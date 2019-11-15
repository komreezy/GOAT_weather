//
//  CLLocation+Geocode.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/15/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

// https://stackoverflow.com/questions/44031257/find-city-name-and-country-from-latitude-and-longitude-in-swift

extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}
