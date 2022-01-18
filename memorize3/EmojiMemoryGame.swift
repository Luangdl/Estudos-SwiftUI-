//
//  EmojiMemoryGame.swift
//  memorize3
//
//  Created by Luan Gomes on 17/01/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis =  ["🚂","🚀","🚁","🚜","🚕","🚌","🏎","🚑","🚒","🚞","✈️","🚂","⛴","⛵️","🛶","🛸","🚡","🚲"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}

