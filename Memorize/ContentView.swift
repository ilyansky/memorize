//
//  ContentView.swift
//  Memorize
//
//  Created by Satin on 06.08.2025.
//

import SwiftUI



struct ContentView: View {

    var body: some View {

        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.mint)
        .padding()
    }

}

struct CardView: View {

    @State var isFaceUp: Bool = false
    
    var body: some View {

        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text("👻").font(.largeTitle)
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
