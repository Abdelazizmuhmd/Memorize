//
//  MemoryGame.swift
//  Memorize
//
//  Created by Zizo on 7/24/20.
//  Copyright © 2020 Abdelazizfmohamed@gmail.com. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
  private(set) var cards:Array<Card>
    
   private var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get{ cards.indices.filter {cards[$0].isFaceUp}.only }
        
        set{
            for index in cards.indices{
            cards[index].isFaceUp = index == newValue
            }
        }
    }
//    var indexOfTheOneAndOnlyFaceUpCard: Int?{
//         get{
//             var faceUpCardIndices = [Int]()
//             for index in cards.indices
//             {
//                 if cards[index].isFaceUp{
//                 faceUpCardIndices.append(index)
//                 }
//
//             }
//             if faceUpCardIndices.count == 1{
//                 return faceUpCardIndices.first
//             }else{
//                 return nil
//             }
//         }
//
//         set{
//             for index in cards.indices{
//                 if index == newValue{
//                 cards[index].isFaceUp = true
//                 }else{
//                 cards[index].isFaceUp = false
//                 }
//
//             }
//         }
//     }
//
 mutating func choose(card: Card){
        print("card chosen: \(card)")
    if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
        if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
            if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
                  self.cards[chosenIndex].isFaceUp = true
        }else{
             
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
        }
      
    }
}
    

    
    init(numberOfPairsOfCards: Int,cardContentFactory: (Int)->CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            cards.append(Card(id: pairIndex*2,content: cardContentFactory(pairIndex)))
            cards.append(Card(id: pairIndex*2+1,content: cardContentFactory(pairIndex)))

        }
        cards.shuffle()
    }
    
    struct Card: Identifiable{
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
}
