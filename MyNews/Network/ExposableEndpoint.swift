//
//  ExposableEndpoint.swift
//  Network
//
//  Created by Bryan Barreto on 29/08/21.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

public protocol ExposableEndpoint {
    var url: String {get}
    var header: [String: String] {get}
    var httpMethod: HTTPMethod {get}
}

extension ExposableEndpoint {
    var header: [String: String] {
        return ["X-Api-Key":"0105a56ed6064dd5b1bc1a7e5fb09608"]
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
}
