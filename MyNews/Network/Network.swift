//
//  Network.swift
//  Network
//
//  Created by Bryan Barreto on 29/08/21.
//

import Foundation

public class Network {
    public let shared = Network()
    
    private init() {}
    
    public func fetchData<T: Decodable>(endpoint: ExposableEndpoint, completion: @escaping (Result<T, Error>) -> Void) {
        do {
            let request = try buildRequest(endpoint: endpoint)
            makeAPICall(request: request, completion: completion)
        } catch {
            completion(.failure(error))
        }
    }
    
    private func buildRequest(endpoint: ExposableEndpoint) throws -> URLRequest {
        guard let url = URL(string: endpoint.url) else {
            throw APIError.url
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod.rawValue
        
        for header in endpoint.header {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return request
    }
    
    private func makeAPICall<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(APIError.server(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.empty))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(APIError.parse(error)))
            }
        }
        task.resume()
    }
}
