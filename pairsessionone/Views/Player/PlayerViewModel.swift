//
//  PlayerViewModel.swift
//  pairsessionone
//
//  Created by Fernando Martín Ortiz on 25/08/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import AVFoundation
import Combine
import SwiftUI

class PlayerViewModel: ObservableObject {
    @Published var isPlaying: Bool = false
    
    var player = AVPlayer()
    let track: Results
    
    var artworkURL: URL? {
        guard let artwork = track.artworkUrl100 else {
            return nil
        }
        return URL(string: artwork)
    }
    
    init(track: Results) {
        self.track = track
    }
    
    func playPreview() {
        guard let pathURL = track.previewUrl, let remoteURL = URL(string: pathURL) else { return }
        let playerItem = AVPlayerItem(url: remoteURL)
        player = AVPlayer(playerItem:playerItem)
        player.rate = 1.0
        player.volume = 0.2
        player.play()
        isPlaying = true
    }
    
    func pausePreview() {
        player.pause()
        isPlaying = false
    }
}

