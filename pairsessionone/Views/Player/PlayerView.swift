//
//  PlayerView.swift
//  pairsessionone
//
//  Created by Fernando Martín Ortiz on 25/08/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import SwiftUI
import URLImage

struct PlayerView: View {
    
    @ObservedObject var viewModel: PlayerViewModel
    
    init(track: Results) {
        self.viewModel = PlayerViewModel(track: track)
        
    }
    
    var body: some View {
        VStack {
            trackArtistName
            trackName
            artwork
            Spacer()
            buttons
            Spacer()
        }
    }
    
    var artwork: some View {
        if let artworkURL = viewModel.artworkURL {
            return AnyView(
                URLImage(artworkURL)
                    .frame(width: 200, height: 200)
            )
        } else {
            return AnyView(EmptyView())
        }
    }
    
    var trackArtistName: some View {
        Text(viewModel.track.artistName ?? "")
            .font(.subheadline)
    }
    
    var trackName: some View {
        Text(viewModel.track.trackName ?? "")
            .font(.headline)
    }
    
    var buttons: some View {
        HStack {
            viewModel.isPlaying
                ? PlayerButton(buttonType: .pause, action: pauseTrack)
                : PlayerButton(buttonType: .play, action: playTrack)
        }
    }
    
    func playTrack() {
        viewModel.playPreview()
    }
    
    func pauseTrack() {
        viewModel.pausePreview()
    }
}

struct PlayerButton: View {
    enum ButtonType {
        case play, pause
        
        var systemImage: String {
            switch self {
            case .play: return "play"
            case .pause: return "pause"
            }
        }
    }
    
    let buttonType: ButtonType
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: buttonType.systemImage)
                .resizable()
                .frame(width: 50, height: 50)
        }
    }
}
