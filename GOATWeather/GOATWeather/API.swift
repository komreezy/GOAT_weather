//
//  API.swift
//  GOATWeather
//
//  Created by Komran Ghahremani on 11/14/19.
//  Copyright © 2019 Komran Ghahremani. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = [String: Any]
typealias FetchCompletionHandler = (Result<JSON>) -> Void

protocol Requesting {
    var queue: DispatchQueue { get }
    
    func request(for route: Route, completion: @escaping FetchCompletionHandler)
}

extension Requesting {
    func request(for route: Route, completion: @escaping FetchCompletionHandler) {
        do {
            let req = try route.asURLRequest()
            Alamofire.request(req)
                .responseJSON(queue: queue, options: .allowFragments) { response in
                    if let json = response.result.value as? JSON, response.error == nil {
                        completion(.success(json))
                    } else {
                        completion(.failure(HomeAPIError.general(response.error?.localizedDescription)))
                    }
            }
        } catch {
            fatalError("cant do that request")
        }
    }
}

protocol Route {
    var method: Alamofire.HTTPMethod { get }
    var path: String { get }
    var parameters: [String: Any]? { get }

    func asURLRequest() throws -> URLRequest
}

extension Route {
    func asURLRequest() throws -> URLRequest {
        let urlwithPercent = AppEnvironment.baseURLString.appending(path).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: urlwithPercent)!

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return try Alamofire.JSONEncoding.default.encode(urlRequest, with: parameters)
    }
}

protocol Gateway {
    associatedtype APIRoute: Route
}
