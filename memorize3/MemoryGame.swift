//
//  MemoryGame.swift
//  memorize3
//
//  Created by Luan Gomes on 17/01/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
            !cards[chosenIndex].isFaceup,
            !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceup = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceup.toggle()
        }
        print("\(cards)")
    }
    
    init(numberOfPairsOfCards: Int, CreateCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content:CardContent = CreateCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceup: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
