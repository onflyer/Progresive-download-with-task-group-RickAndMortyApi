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
    @Published var charachtersWithTaskGroup: [GetSingleCharcter] = []
    
    let networkingService = NetworkingService()
    
    
    //MARK: SHOW JSON AS IT DOWNLOADS BY CHAR IDS, NOT WAITING FOR WHOLE RESPONSE
    @MainActor
    func loadCharactersWithTaskGroup(ids: [Int]) async {
        
       
            charachtersWithTaskGroup = []
        
        
        do {
            
            let taskGroupService = NetworkingService()
            
            try await withThrowingTaskGroup(of: (Int, GetSingleCharcter).self, body: { group in
                
                for id in ids {
                    group.addTask {
                        return (id, try await taskGroupService.fetchOneCharacter(charID: id))
                    }
                }
                
                for try await (_, singleChar) in group {
                    charachtersWithTaskGroup.append(singleChar)
                }
            })
        } catch {
           
                errorMsg = "Error: \(error)"
                print(error)
            
        }
        
        
        print(charachtersWithTaskGroup.count)
       
        //MARK: SORT BY ID (1-100)
        charachtersWithTaskGroup.sort { $0.id < $1.id }
        
    }
    
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
            await MainActor.run(body: {
            self.allCharacters = allResponse.results
            })
        } catch {
            await MainActor.run(body: {
                errorMsg = "Error: \(error)"
                print(error)
            })
        }
    }
    
}
