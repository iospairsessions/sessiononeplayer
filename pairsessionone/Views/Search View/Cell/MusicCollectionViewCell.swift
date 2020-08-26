//
//  MusicCollectionViewCell.swift
//  pairsessionone
//
//  Created by Jesus Parada on 11/08/20.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {
    
    private lazy var songTitleLabel: UILabel = {
        let songTitleLabel = UILabel()
        songTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return songTitleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(songTitleLabel)
        NSLayoutConstraint.activate([
            songTitleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            songTitleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            songTitleLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            songTitleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor)
        ])
    }
    
    func setSong(_ song: Results) {
        songTitleLabel.text = song.trackCensoredName
    }
}
