//
//  APIError.swift
//  Network
//
//  Created by Bryan Barreto on 29/08/21.
//

import Foundation

public enum APIError: LocalizedError {
    case url
    case server(Error)
    case empty
    case parse(Error)
    
    public var errorDescription: String? {
        switch self {
        case .url:
            return "URL Inválida"
        case .empty:
            return "Nenhum dado retornado"
        case .parse(let error):
            return "Parse Error: \(error.localizedDescription)"
        case .server(let error):
            return "Server Error: \(error.localizedDescription)"
        }
    }
}
