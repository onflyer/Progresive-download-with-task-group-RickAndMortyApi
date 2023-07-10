//
//  EndpointEnum.swift
//  RickAndMortyApi
//
//  Created by Aleksandar Milidrag on 7/10/23.
//

import Foundation

enum Endpoint {
    case getAllCharacters
    case getSingleCharacter(charID: Int)
    
}

extension Endpoint {
    var fullPath: String {
        base + path
    }
    
}

private extension Endpoint {
    var base: String {
        "https://rickandmortyapi.com/api"
    }
    
    var path: String {
        switch self {
        case .getAllCharacters:
            return "/character"
        case .getSingleCharacter(let charID):
            return "/character/\(charID)"
        }
    }
}
