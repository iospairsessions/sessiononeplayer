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
    
    private func handleSearchs(with query: String) {
        NetworkLayer.request(provider: .searchMusic(query: query)) { (result: Result<SearchResult, Error>)  in
            switch result {
            case .success(let searchResult):
                print(searchResult)
                self.playPreview(url: searchResult.tracks?.first?.previewUrl)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @objc func reload(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else {
            player.pause()
            print("Nothing to play")
            return
        }
        handleSearchs(with: query)
    }
}

extension MusicSearchViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        handleSearchs(with: query)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload(_:)), object: searchBar)
        perform(#selector(self.reload(_:)), with: searchBar, afterDelay: 0.5)
    }
}
