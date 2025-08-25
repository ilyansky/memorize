//
//  MemorizeViewModel.swift
//  Memorize
//
//  Created by Satin on 16.08.2025.
//

import SwiftUI

class MemorizeViewModel: ObservableObject {

    private static let emojis = ["🐸", "🐷", "🦁", "🦊", "🐼", "🐻", "🐯", "🐵", "🦋", "🦄"]
    private static func createModel() -> MemorizeModel<String> {

        MemorizeModel(
            numberOfPairsOfCards: 10
        ) { pairIndex in

            guard emojis.indices.contains(pairIndex) else {
                return "❓"
            }

            return emojis[pairIndex]
        }
    }

    @Published private var model = createModel()

    var cards: [MemorizeModel<String>.Card] {
        model.cards
    }

    // MARK: Intents

    func shuffle() {
        model.shuffle()
    }

    func choose(_ card: MemorizeModel<String>.Card) {
        return model.choose(card)
    }

}
