//
//  ContentView.swift
//  Memorize
//
//  Created by Abdelaziz on 7/22/20.
//  Copyright © 2020 Abdelazizfmohamed@gmail.com. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    HStack() {
        ForEach(0..<4) {  index in
            Cardview(isFaceUP: false)
        }
    }
        .font(Font.largeTitle)
        .padding()
        .foregroundColor(Color.orange)
    }
    
}


struct Cardview: View{
    var isFaceUP: Bool
    var body: some View{
        ZStack(){
        if isFaceUP{
           RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
           RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
           Text("👻")
        }else {
            RoundedRectangle(cornerRadius: 10.0).fill()

            }

        }
    }
    
}

































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
