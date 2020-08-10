//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Zizo on 7/24/20.
//  Copyright © 2020 Abdelazizfmohamed@gmail.com. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
 
  @Published private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
  private static  func createMemoryGame() -> MemoryGame<String>{
    let emojis: Array<String> = ["😆","😌"]
    return MemoryGame<String>(numberOfPairsOfCards: emojis.count){ pairIndex in emojis[pairIndex]}
    }
    
    // MARK: - Acccess to the model
    
    var cards: Array<MemoryGame<String>.Card>{
        game.cards
    }
    
    
   // MARK: - Intent
    func choose(card: MemoryGame<String>.Card){
        game.choose(card: card)
        
    }
    func resetGame(){
        game = EmojiMemoryGame.createMemoryGame()
    }
    
}
