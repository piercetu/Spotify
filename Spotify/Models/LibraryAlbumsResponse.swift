//
//  LibraryAlbumsResponse.swift
//  Spotify
//
//  Created by Pierce Tu on 5/30/21.
//

import Foundation

struct LibraryAlbumsResponse: Codable {
    let items: [SavedAlbum]
}

struct SavedAlbum: Codable {
    let added_at: String
    let album: Album
}
