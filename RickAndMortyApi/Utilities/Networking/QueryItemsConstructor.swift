//
//  QueryItemsConstructor.swift
//  RickAndMortyApi
//
//  Created by Aleksandar Milidrag on 7/10/23.
//

import Foundation


typealias Parameters = [String: String]

struct APIConstructor {
    let endpoint: Endpoint
    var queryParams: Parameters = [:]
}

