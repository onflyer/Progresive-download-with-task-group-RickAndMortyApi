//
//  HomeViewModel.swift
//  RickAndMortyApi
//
//  Created by Aleksandar Milidrag on 7/10/23.
//

import Foundation

final class HomeViewModel: ObservableObject {

    @Published var characters: [GetSingleCharcter] = []
    @Published var errorMsg = ""
    @Published var allCharacters: [Characters] = []
    
    let networkingService = NetworkingService()
    
    func getSingleChar() async {
        do {
            let charResponse = try await networkingService.fetchOneCharacter(charID: Int.random(in: 0...20))
            await MainActor.run(body: {
            self.characters.append(charResponse)
            })
            
        } catch {
            await MainActor.run(body: {
                errorMsg = "Error: \(error)"
                print(error)
            })
           
        }
    }
    
    func loadCharcters() async {
        do {
            let allResponse: GetAllCharacters = try await networkingService.fetchData(api: APIConstructor(endpoint:.getAllCharacters))
            self.allCharacters = allResponse.results
        } catch {
            await MainActor.run(body: {
                errorMsg = "Error: \(error)"
                print(error)
            })
        }
    }
    
}
