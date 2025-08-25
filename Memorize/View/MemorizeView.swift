//
//  MemorizeView.swift
//  Memorize
//
//  Created by Satin on 06.08.2025.
//

import SwiftUI

struct MemorizeView: View {

    @ObservedObject var viewModel: MemorizeViewModel

    var body: some View {

        VStack(spacing: 0) {
            title

            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }

            HStack(spacing: 30) {
                Button("Shuffle") {
                    viewModel.shuffle()
                }
                newGameButton
            }
        }
        .padding()
    }

    var title: some View {

        Text("Memorize")
            .font(.largeTitle)
            .bold()
    }

    var cards: some View {

        LazyVGrid(
            columns:
                [GridItem(
                    .adaptive(
                        minimum: 100,
                        maximum: 120
                    ),
                    spacing: 0
                )],
            spacing: 0
        ) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(2)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
    }

    var newGameButton: some View {

        Button("New game") {
            viewModel.startNewGame()
        }
    }

}

#Preview {
    MemorizeView(viewModel: MemorizeViewModel())
}
