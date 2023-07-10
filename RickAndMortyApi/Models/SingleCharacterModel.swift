//
//  SingleCharacterModel.swift
//  RickAndMortyApi
//
//  Created by Aleksandar Milidrag on 7/10/23.
//

import Foundation
import SwiftUI

// MARK: - GetSingleCharcter
struct GetSingleCharcter: Codable, Identifiable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin, location: LocationForSingleChar
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    // MARK: - Location
    struct LocationForSingleChar: Codable {
        let name: String
        let url: String
    }
    
    
    
    
    static func previewExample() -> GetSingleCharcter {
        GetSingleCharcter(id: 1,
                          name: "Rick",
                          status: "Alive",
                          species: "Human",
                          type: "No type",
                          gender: "Male",
                          origin: LocationForSingleChar(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
                          location: LocationForSingleChar(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
                          image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                          episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2", "https://rickandmortyapi.com/api/episode/3" ],
                          url: "https://rickandmortyapi.com/api/character/1",
                          created: "2017-11-04T18:48:46.250Z")
    }

}



