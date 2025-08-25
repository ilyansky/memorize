//
//  MemorizeModel.swift
//  Memorize
//
//  Created by Satin on 16.08.2025.
//

import Foundation

struct MemorizeModel<CardContent> where CardContent: Equatable {

    private(set) var cards: [Card] = [] // get-only

    var faceUpCardIndex: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = $0 == newValue } }
    }

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
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {

                if let potentialMatchIndex = faceUpCardIndex {

                    if cards[potentialMatchIndex].content == cards[chosenIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    faceUpCardIndex = chosenIndex
                }

                cards[chosenIndex].isFaceUp = true
            }
        }
    }

    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {

        var isFaceUp = false
        var isMatched = false
        let content: CardContent

        var id: String
        var debugDescription: String {
            "\(id): \(isMatched ? "matched" : "not matched")"
        }
    }
}
