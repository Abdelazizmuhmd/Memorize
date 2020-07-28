//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Abdelaziz on 7/22/20.
//  Copyright © 2020 Abdelazizfmohamed@gmail.com. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject  var viewModel : EmojiMemoryGame
    var body: some View {
    HStack() {
        ForEach(viewModel.cards) {  card in
            Cardview(card: card).onTapGesture {
                self.viewModel.choose(card:card)
            }
        }
    }
        .font(Font.largeTitle)
        .padding()
        .foregroundColor(Color.orange)
    }
    
}


struct Cardview: View{
    var card: MemoryGame<String>.Card
    var body: some View{
        ZStack(){
        if card.isFaceUp{
           RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
           RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
            Text(card.content)
        }else {
            RoundedRectangle(cornerRadius: 10.0).fill()

            }

        }
    }
    
}

































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
