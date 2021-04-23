//
//  PlaybackPresenter.swift
//  Spotify
//
//  Created by Pierce Tu on 4/22/21.
//

import UIKit

final class PlaybackPresenter {
    
    static func startPlayback(from viewController: UIViewController, track: AudioTrack) {
        let vc = PlayerViewController()
        viewController.present(vc, animated: true, completion: nil)
    }
    
    static func startPlayback(from viewController: UIViewController, album: Album) {
        
    }
    
    static func startPlayback(from viewController: UIViewController, playlist: Playlist) {
        
    }
}
