//
//  SettingsModels.swift
//  Spotify
//
//  Created by Pierce Tu on 2/28/21.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
