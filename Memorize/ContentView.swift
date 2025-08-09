//
//  ContentView.swift
//  Memorize
//
//  Created by Satin on 06.08.2025.
//

import SwiftUI

struct ContentView: View {

    let emojis = ["👻", "😈", "🎉", "😝", "👻", "😈", "🎉", "😝"]
    @State var cardCount = 4

    var body: some View {

        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }

    // это не @ViewBuilder, это обычное замыкание (#needtoapprove замыкание?)
    var cards: some View {

        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120, maximum: 200))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.mint)
    }

    var cardCountAdjusters: some View {

        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }

    func makeCardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button {
            cardCount += offset
        } label: {
            Image(systemName: symbol)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }

    var cardRemover: some View {
        makeCardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus")
    }

    var cardAdder: some View {
        makeCardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus")
    }

}

struct CardView: View {

    let content: String
    @State var isFaceUp: Bool = true

    var body: some View {

        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)

            base.fill(.white)
            base.strokeBorder(lineWidth: 3)
            Text(content).font(.largeTitle)

            base.opacity(isFaceUp ? 0 : 1)
            // если вместо opacity использовать if else - тогда ряд вью без смайликов будет сжиматься, тк LazyVGrid старается занять как можно меньше места

        }
        .onTapGesture {
            isFaceUp.toggle()
            print(1)
        }
    }
}


#Preview {
    ContentView()
}
