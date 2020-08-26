//
//  MusicSearchView.swift
//  pairsessionone
//
//  Created by Juan Ortiz on 18/08/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import SwiftUI

struct MusicSearchView: View {
    
    @ObservedObject var viewModel = MusicSearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                MusicSearchBar(searchText: self.$viewModel.searchText)
                
                List(self.viewModel.datasource) { result in
                    NavigationLink(destination: PlayerView(track: result)) {
                        Text(result.trackName ?? "")
                    }
                }
            }
            .navigationBarTitle("Search Music")
        }
    }
}

struct MusicSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MusicSearchView()
    }
}

struct MusicSearchBar: View {
    
    let searchText: Binding<String>
    
    var body: some View {
        HStack {
            HStack {
                
                Image(systemName: "magnifyingglass")
                    .padding(8)
                
                TextField("Search", text: searchText)
                    .padding(EdgeInsets(top: 8, leading: 4, bottom: 8, trailing: 4))
                
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            
        }.padding(.horizontal)
    }
}
