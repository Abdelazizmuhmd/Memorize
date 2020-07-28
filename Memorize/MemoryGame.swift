//
//  MemoryGame.swift
//  Memorize
//
//  Created by Zizo on 7/24/20.
//  Copyright © 2020 Abdelazizfmohamed@gmail.com. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent>{
    var cards:Array<Card>
   
 mutating func choose(card: Card){
        print("card chosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
        
    }
    
    func index(of card: Card) -> Int{
        for index in 0..<self.cards.count{
            if self.cards[index].id==card.id{
                return index
            }
            
        }
    return 0    // TODO: bougus!
    }
    
    init(numberOfPairsOfCards: Int,cardContentFactory: (Int)->CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            cards.append(Card(id: pairIndex*2,content: cardContentFactory(pairIndex)))
            cards.append(Card(id: pairIndex*2+1,content: cardContentFactory(pairIndex)))

        }
    }
    
    struct Card: Identifiable{
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
}
