//
//  CardView.swift
//  Memorize
//
//  Created by Satin on 12.08.2025.
//

import SwiftUI

struct CardView: View {

    let card: MemorizeModel<String>.Card

    init(_ card: MemorizeModel<String>.Card) {
        self.card = card
    }

    var body: some View {

        let base = RoundedRectangle(cornerRadius: 15)

        ZStack {
            base.fill(.white)
            base.strokeBorder(lineWidth: 3)
            Text(card.content)
                .font(.system(size: 200))
                .minimumScaleFactor(0.01)
                .aspectRatio(1, contentMode: .fit)

            base.opacity(card.isFaceUp ? 0 : 1)
        }
        .foregroundColor(.purple)
    }
}
