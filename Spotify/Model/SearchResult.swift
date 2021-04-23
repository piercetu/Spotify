//
//  SearchResult.swift
//  Spotify
//
//  Created by Pierce Tu on 4/21/21.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
