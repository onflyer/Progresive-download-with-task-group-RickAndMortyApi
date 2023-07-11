//
//  ContentView.swift
//  RickAndMortyApi
//
//  Created by Aleksandar Milidrag on 7/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = HomeViewModel()
    
    
    var body: some View {
        
        List {
            ForEach(vm.allCharacters) { character in
                VStack {
                    Text(character.name)
                    Text("Created at: \(character.created.formatted(date: .numeric, time: .shortened))")
                    
                    
                    
                    
                    
                }
            }
        }
        .task {
            await vm.loadCharcters()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
