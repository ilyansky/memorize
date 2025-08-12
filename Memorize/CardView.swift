//
//  CardView.swift
//  Memorize
//
//  Created by Satin on 12.08.2025.
//

import SwiftUI

struct CardView: View {

    let content: String
    let color: Color
    @State var isFaceUp = true

    var body: some View {

        let base = RoundedRectangle(cornerRadius: 15)

        ZStack {
            base.fill(.white)
            base.strokeBorder(lineWidth: 3)
            Text(content).font(.largeTitle)

            base.opacity(isFaceUp ? 0 : 1)
        }
        .foregroundColor(color)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
