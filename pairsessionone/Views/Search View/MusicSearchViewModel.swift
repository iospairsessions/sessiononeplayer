//
//  ViewController.swift
//  pairsessionone
//
//  Created by Andres Rivas on 04-08-20.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import AVFoundation
import Combine
import SwiftUI

class MusicSearchViewModel: ObservableObject {
    
    enum Section: CaseIterable {
        case songs
    }
    
    var cancellables: Set<AnyCancellable> = .init()
    
    @Published var datasource: [Results] = []
    
    @Published var searchText: String = ""
    
    init() {
        $searchText.sink { newValue in
            self.handleSearchs(with: newValue)
        }.store(in: &cancellables)
    }
    
    private func handleSearchs(with query: String) {
        NetworkLayer.request(provider: .searchMusic(query: query)) { (result: Result<SearchResult, Error>)  in
            switch result {
            case .success(let searchResult):
                print(searchResult)
                self.datasource = searchResult.tracks ?? []
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

