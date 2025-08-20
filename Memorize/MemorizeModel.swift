//
//  MemorizeModel.swift
//  Memorize
//
//  Created by Satin on 16.08.2025.
//

import Foundation

struct MemorizeModel<CardContent> where CardContent: Equatable {

    private(set) var cards: [Card] = [] // get-only

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {

        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)

            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }

    mutating func shuffle() {
        cards.shuffle()
    }

    mutating func choose(_ card: Card) {
        cards[index(of: card)].isFaceUp.toggle()
        print(card.debugDescription)
    }

    private func index(of card: Card) -> Int {

        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }

        return 0
    }

    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {

        var isFaceUp = true
        var isMatched = false
        let content: CardContent

        var id: String
        var debugDescription: String {
            "\(id): \(content), \(isFaceUp ? "up" : "down"), \(isMatched ? "matched" : "")"
        }
    }
}
