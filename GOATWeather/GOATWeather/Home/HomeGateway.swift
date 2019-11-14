//
//  HomeGateway.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import Foundation
import Alamofire

final class HomeGateway: Gateway, Requesting {
    let queue = DispatchQueue(label: "com.GOAT.networking", qos: .utility, attributes: [.concurrent])

    enum APIRoute: Route {
        case forecast(lat: Float, lng: Float)
        case timeMachine(lat: Float, lng: Float, time: Int)

        var method: HTTPMethod {
            switch self {
            case .forecast, .timeMachine: return .get
            }
        }

        var path: String {
            switch self {
            case .forecast(let latitude, let longitude): return "forecast/\(AppEnvironment.secretKey)/\(latitude),\(longitude)"
            case .timeMachine(let latitude, let longitude, let time): return "forecast/\(AppEnvironment.secretKey)/\(latitude),\(longitude),\(time)"
            }
        }

        var parameters: [String : Any]? {
            switch self {
            case .forecast, .timeMachine: return nil
            }
        }
    }
}

enum HomeAPIError: Error {
    case general(String?)
    case parsing

    var localizedDescription: String {
        switch self {
        case .general(let error): return error ?? "Unable to complete Home API Request"
        case .parsing: return "Unable to parse HOME API JSON Response"
        }
    }
}
