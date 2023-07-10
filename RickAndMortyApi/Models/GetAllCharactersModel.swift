//
//  GetAllCharactersModel.swift
//  RickAndMortyApi
//
//  Created by Aleksandar Milidrag on 7/10/23.
//

import Foundation

// MARK: - GetAllCharacters
struct GetAllCharacters: Codable {
    let info: Info
    let results: [Characters]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: JSONNull?
}

// MARK: - Result
struct Characters: Codable, Identifiable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
