//
//  APIClient.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

typealias ResultCallback<T> = (Result<T, NetworkStackError>) -> Void

protocol APIClient {
    func request<T: Decodable>(_ endpoint: EndpointTarget, completion: @escaping ResultCallback<T>) -> URLSessionDataTask?
}
