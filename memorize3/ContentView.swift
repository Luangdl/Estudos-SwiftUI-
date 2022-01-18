//
//  ContentView.swift
//  memorize3
//
//  Created by Luan Gomes on 17/01/22.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) {card in CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceup {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }else {
                shape.fill()
            }
        }
    }
}

//poderia ser escrito assim ??


/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}*/
