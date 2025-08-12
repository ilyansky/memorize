//
//  ContentView.swift
//  Memorize
//
//  Created by Satin on 06.08.2025.
//

import SwiftUI

struct MemorizeView: View {

    @State var currentTheme: Theme = .robots
    @State var emojis: [String] = []

    var body: some View {

        VStack {
            title
            cards
            themeChanger
        }
        .padding()
    }

    var title: some View {

        Text("Memorize")
            .font(.largeTitle)
            .bold()
    }

    var cards: some View {

        // 8 - 70
        // 7 - 75
        // 6 - 80
        // 5 - 85

        ScrollView {
            LazyVGrid(columns:
                        [GridItem(.adaptive(minimum: calcMinimumWidthForGridItem(numberOfPairs: emojis.count / 2), maximum: 120))]
            ) {
                ForEach(0..<emojis.count, id: \.self) { index in
                    CardView(
                        content: emojis[index],
                        color: currentTheme.color
                    )
                    .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
    }

    @ViewBuilder
    var chooseThemeView: some View {

        if emojis.isEmpty {
            Text("Choose your deck")
                .font(.title)
        }
    }

    var themeChanger: some View {

        VStack(spacing: 20) {
            chooseThemeView

            HStack(spacing: 50) {
                makeChangeThemeButton(to: .robots)
                makeChangeThemeButton(to: .emojis)
                makeChangeThemeButton(to: .animals)
            }
        }
    }

    private func updateDeck() {

        let numberOfPairs = switch currentTheme {
        case .robots: Int.random(in: 2...4)
        case .emojis: Int.random(in: 2...6)
        case .animals: Int.random(in: 2...8)
        }

        let deck = currentTheme.emojis[0..<numberOfPairs]

        emojis = (deck + deck).shuffled()
    }

    private func makeChangeThemeButton(to theme: Theme) -> some View {

        Button {
            currentTheme = theme
            updateDeck()
        } label: {
            VStack {
                Image(systemName: theme.rawValue)
                    .imageScale(.large)
                    .font(.title)
                Text(theme.text)
            }
            .tint(theme.color)
        }
    }

    private func calcMinimumWidthForGridItem(numberOfPairs: Int) -> CGFloat {

        switch numberOfPairs {
        case 5: 80
        case 6: 75
        case 7: 70
        case 8: 65
        default: 90
        }
    }
}

#Preview {
    MemorizeView()
}
