//
//  Cardify.swift
//  Memorize
//
//  Created by Zizo on 8/3/20.
//  Copyright © 2020 Abdelazizfmohamed@gmail.com. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier{
    var rotation: Double
    var isFaceUp: Bool{
        rotation < 90
    }
    init(isFaceUp: Bool) {
        rotation =  isFaceUp ? 0 : 180
    }
    var animatableData: Double{
        get{ return rotation}
        set{rotation =  newValue }
    }
    
    private  let cornerRadius: CGFloat = 10.0
    private  let edgeLineWidth: CGFloat = 3
    
    func body(content: Content) -> some View{
        ZStack(){
                if isFaceUp{
                       RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                       RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                       content
               }else {
        
                       RoundedRectangle(cornerRadius: cornerRadius).fill()
                       
                   }

               }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))

    }
}

extension View{
    func cardify(isFaceUp:Bool)-> some View{
        self.modifier(Cardify(isFaceUp: isFaceUp))
        
    }
}

