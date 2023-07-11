//
//  NetworkingService.swift
//  RickAndMortyApi
//
//  Created by Aleksandar Milidrag on 7/10/23.
//

import Foundation

enum NetworkingServiceError: Error {
    case invalidStatusCode
    case badUrl
}

actor NetworkingService {
    func fetchData<T: Decodable>(api: APIConstructor) async throws -> T {
        let url = try DefaultURLBuilder.build(for: api.endpoint, params: api.queryParams)
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300
        else {
            throw NetworkingServiceError.invalidStatusCode
        }
        print(response.statusCode)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
   
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let parsedData = try decoder.decode(T.self, from: data)
        return parsedData
    }
    
    func fetchOneCharacter(charID: Int) async throws -> GetSingleCharcter {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(charID)") else {
            throw NetworkingServiceError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300
        else {
            throw NetworkingServiceError.invalidStatusCode
        }
        
        let parsedChar = try JSONDecoder().decode(GetSingleCharcter.self, from: data)
        
        return parsedChar
        
    }
   
}
