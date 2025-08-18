//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Satin on 06.08.2025.
//

import SwiftUI

@main
struct MemorizeApp: App {

    @StateObject var game = MemorizeViewModel()

    var body: some Scene {

        WindowGroup {
            MemorizeView(viewModel: game)
        }
    }
}
