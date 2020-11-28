//
//  URLSessionAPIClient.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 27/11/20.
//

import Foundation

class URLSessionAPIClient: APIClient {
    private let urlSession: URLSession
    private let parser: Parser
    
    init(urlSession: URLSession = URLSession(configuration: .default), parser: Parser = JSONParser()) {
        self.urlSession = urlSession
        self.parser = parser
    }
    
    // MARK: - Request
    
    @discardableResult
    func request<T: Decodable>(_ target: EndpointTarget, completion: @escaping ResultCallback<T>) -> URLSessionDataTask? {
        guard let request = target.request else {
            completion(.failure(.invalidRequestObject))
            return nil
        }
        
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                DispatchQueue.main.async { completion(.failure(.requestError(error))) }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async { completion(.failure(.dataMissing)) }
                return
            }
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            guard APIConfig.validStatusCodes.contains(statusCode) else {
                let error = NetworkStackError.invalidResponseStatusCode(statusCode)
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }
            do {
                let result = try self.parser.parse(data, type: T.self)
                DispatchQueue.main.async { completion(.success(result)) }
            } catch {
                DispatchQueue.main.async { completion(.failure(.parsingError(error, data: data))) }
            }
        }
        task.resume()
        return task
    }
}
