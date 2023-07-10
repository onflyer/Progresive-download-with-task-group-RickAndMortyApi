//
//  DefaultURLBuilder.swift
//  RickAndMortyApi
//
//  Created by Aleksandar Milidrag on 7/10/23.
//

import Foundation

enum URLBuilderError: Error {
    case invalidFullPath, invalidURL
}

enum DefaultURLBuilder {
    
    
    
    static func build(for endpoint: Endpoint, params: [String: String] = [:]) throws -> URL {
        guard var urlComponents = URLComponents(string: endpoint.fullPath) else {
            throw URLBuilderError.invalidFullPath
        }
        
        urlComponents.queryItems = buildQueryItems(params)
        
        guard let url = urlComponents.url else {
            throw URLBuilderError.invalidURL
        }
        
        return url
    }
}

private extension DefaultURLBuilder {
    static func buildQueryItems(_ params: [String: String]...) -> [URLQueryItem] { /// three dots is for multiple parameters in func
        params.flatMap { $0 }.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
