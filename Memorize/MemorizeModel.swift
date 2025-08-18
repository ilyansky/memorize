//
//  MemorizeModel.swift
//  Memorize
//
//  Created by Satin on 16.08.2025.
//

import Foundation

struct MemorizeModel<CardContent> {

    private(set) var cards: [Card] = [] // get-only

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {

        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)

            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }

    mutating func shuffle() {
        cards.shuffle()
    }

    func choose(_ card: Card) {
        
    }

    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
