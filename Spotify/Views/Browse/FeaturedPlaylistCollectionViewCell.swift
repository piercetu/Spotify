//
//  FeaturedPlaylistCollectionViewCell.swift
//  Spotify
//
//  Created by Pierce Tu on 3/2/21.
//

import UIKit

class FeaturedPlaylistCollectionViewCell: UICollectionViewCell {
    static let identifier = "FeaturedPlaylistCollectionViewCell"
    
    private let playlistCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let playlistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let creatorNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .thin)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        contentView.addSubview(playlistCoverImageView)
        contentView.addSubview(playlistNameLabel)
        contentView.addSubview(creatorNameLabel)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.height - 70
        creatorNameLabel.frame = CGRect(x: 3, y: contentView.height - 44, width: contentView.width - 6, height: 30)
        playlistNameLabel.frame = CGRect(x: 3, y: contentView.height - 60, width: contentView.width - 6, height: 30)
        playlistCoverImageView.frame = CGRect(x: (contentView.width - imageSize) / 2, y: 3, width: imageSize, height: imageSize)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        playlistNameLabel.text = nil
        playlistCoverImageView.image = nil
        creatorNameLabel.text = nil
    }
    
    func configure(with viewModel: FeaturedPlaylistsCellViewModel) {
        playlistNameLabel.text = viewModel.name
        playlistCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
        creatorNameLabel.text = viewModel.creatorName
    }
}
