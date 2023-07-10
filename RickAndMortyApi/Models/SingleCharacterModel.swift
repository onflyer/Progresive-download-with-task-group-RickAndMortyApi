//
//  SingleCharacterModel.swift
//  RickAndMortyApi
//
//  Created by Aleksandar Milidrag on 7/10/23.
//

import Foundation

// MARK: - GetSingleCharcter
struct GetSingleCharcter: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: LocationForSingleChar
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct LocationForSingleChar: Codable {
    let name: String
    let url: String
}
