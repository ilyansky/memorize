//
//  Theme.swift
//  Memorize
//
//  Created by Satin on 12.08.2025.
//

import SwiftUI

enum Theme: String {

    case robots = "figure.walk.circle"
    case emojis = "face.dashed"
    case animals = "lizard.circle"

    var emojis: [String] {

        switch self {
        case .robots:  ["👾", "👻", "👽", "🤖"]
        case .emojis: ["😀", "😡", "😈", "🥶", "🫥", "😱"]
        case .animals:  ["🐸", "🐷", "🦁", "🦊", "🐼", "🐻", "🐯", "🐵"]
        }
    }

    var color: Color {

        switch self {
        case .robots: .blue
        case .emojis: .yellow
        case .animals: .green
        }
    }

    var text: String {

        switch self {
        case .robots: "Robots"
        case .emojis: "Emojis"
        case .animals: "Animals"
        }
    }
}

