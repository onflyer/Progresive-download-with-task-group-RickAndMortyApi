//
//  ImageView.swift
//  RickAndMortyApi
//
//  Created by Aleksandar Milidrag on 7/19/23.
//

import SwiftUI

struct ImageView: View {
    let char: GetSingleCharcter
    
    var body: some View {
        VStack {
            AsyncImage(url: .init(string: char.image)) { image in
                image.resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            Text(char.name)

            
        }
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(char: GetSingleCharcter.previewExample() )
    }
}
