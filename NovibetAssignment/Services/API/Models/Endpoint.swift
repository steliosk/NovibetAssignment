//
//  Endpoint.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol EndpointTarget {
    var path: String { get }
    var method: HTTPMethod { get }
    var queryParameters: [String: String]? { get }
    var bodyParameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    var scheme: String { get }
    var host: String { get }
    var request: URLRequest? { get }
}

extension EndpointTarget {
    var scheme: String {
        return "http"
    }
    
    var host: String {
        return APIEnvironment.current.host
    }
    
    var request: URLRequest? {
        guard let url = url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let bodyParameters = bodyParameters {
            guard let httpBody = try? JSONSerialization.data(withJSONObject: bodyParameters) else {
                return nil
            }
            request.httpBody = httpBody
        }
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
}

extension EndpointTarget {
    private var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = "/" + APIConfig.apiVersion + path
        let queryItems = queryParameters?.map({ URLQueryItem(name: $0, value: $1) })
        urlComponents.queryItems = queryItems
        return urlComponents.url
    }
}
