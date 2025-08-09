//
//  ContentView.swift
//  Memorize
//
//  Created by Satin on 06.08.2025.
//

import SwiftUI

struct ContentView: View {

    let emojis = ["👻", "❤️", "👻", "❤️"]

    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.mint)
        .padding()
    }

}

struct CardView: View {

    let content: String
    @State var isFaceUp: Bool = true

    var body: some View {

        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            } else {
                base
            }
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
