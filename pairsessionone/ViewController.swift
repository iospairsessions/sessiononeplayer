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
    
    enum Section: CaseIterable {
        case songs
    }
    
    var player = AVPlayer()
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout())
        collection.register(MusicCollectionViewCell.self, forCellWithReuseIdentifier: "MusicCollectionViewCell")
        collection.delegate = self
        collection.dataSource = makeDataSource()
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
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

    private func collectionLayout () -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
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

extension MusicSearchViewController: UICollectionViewDelegate {
    
}

private extension MusicSearchViewController {
    
    func makeDataSource() -> UICollectionViewDiffableDataSource<Section, Results> {
        let reuseIdentifier = "MusicCollectionViewCell"
        return UICollectionViewDiffableDataSource(
            collectionView: collectionView,
            cellProvider: {  collectionView, indexPath, song in
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: reuseIdentifier,
                    for: indexPath
                    ) as? MusicCollectionViewCell else {
                        return UICollectionViewCell()
                }
                cell.setSong(song)
                return cell
        }
        )
    }
}
