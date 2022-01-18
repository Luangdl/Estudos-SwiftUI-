//
//  memorize3App.swift
//  memorize3
//
//  Created by Luan Gomes on 17/01/22.
//

import SwiftUI

@main
struct memorize3App: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
