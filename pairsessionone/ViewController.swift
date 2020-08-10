//
//  ViewController.swift
//  pairsessionone
//
//  Created by Andres Rivas on 04-08-20.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import UIKit
import AVFoundation

class MusicSearchViewController: UIViewController {

    var provider = NetworkProvider()
    var player = AVPlayer()
    
    lazy var tableview: UITableView = {
        let table = UITableView()
        table.frame = UIScreen.main.bounds
        view.addSubview(table)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        self.title = "Music search"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    private func playPreview(url: String?) {
        guard let pathURL = url, let remoteURL = URL(string: pathURL) else { return }
        let playerItem = AVPlayerItem(url: remoteURL)
        player = AVPlayer(playerItem:playerItem)
        player.rate = 1.0
        player.volume = 0.2
        player.play()
    }
}

extension MusicSearchViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) { }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        provider.getTestData(trackSearch: query, onSuccess: { searchResult in
            print(searchResult.tracks?.first?.trackName)
            self.playPreview(url: searchResult.tracks?.first?.previewUrl)
        }, onError: { error in
            print(error?.localizedDescription)
        })
    }
}

