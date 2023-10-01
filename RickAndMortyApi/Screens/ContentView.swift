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
            ForEach(vm.charachtersWithTaskGroup) { character in
                ImageView(char: character)
                

            }
        }
        .refreshable {
            await vm.loadCharactersWithTaskGroup(ids: Array(0...50))
        }
        .task {
            await vm.loadCharactersWithTaskGroup(ids: Array(0...50))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
