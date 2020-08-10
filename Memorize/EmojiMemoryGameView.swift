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
        VStack{
        Grid(viewModel.cards){ card in
            Cardview(card: card).onTapGesture {
                self.viewModel.choose(card:card)
          }
        .padding(5)
        }
          .padding()
          .foregroundColor(Color.orange)
            Button(action: {
                withAnimation(.easeInOut)
                {
                    self.viewModel.resetGame()
                    
                }
            }, label: {Text("New Game")})
        }
        
    }
}
    



struct Cardview: View{
    var card: MemoryGame<String>.Card
    var body: some View{
        Group(){
        if card.isFaceUp || !card.isMatched{
        GeometryReader{geometry in
        ZStack(){
            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                .padding(5).opacity(0.4)
            Text(self.card.content)
            .font(Font.system(size: self.fontSize(for: geometry.size)))
                .rotationEffect(Angle.degrees(self.card.isMatched ? 360 : 0))
                .animation(self.card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false): .default)
            
              
        }
        .cardify(isFaceUp: self.card.isFaceUp)
        .transition(AnyTransition.scale)
    }}}
            
}
    
    
    // MARK: - Drawing Constants
  private  let cornerRadius: CGFloat = 10
  private  let edgeLineWidth: CGFloat = 3
  private func fontSize(for size: CGSize)->CGFloat{
        min(size.width, size.height)*0.75
    }
    
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel:game)
    }
}
