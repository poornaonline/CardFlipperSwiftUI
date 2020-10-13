//
//  ContentView.swift
//  Dev1
//
//  Created by Poorna Jayasinghe on 2020-10-13.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var game = CardGame()
    
    var body: some View {
        VStack() {
            ForEach(game.holder) { index in
                CardView(isFaceUp: index.isFaceUp, isMatch: index.isChosen, title: index.title).onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    game.chooseCard(card: index)
                })
                    .padding()
            }
        }
    }
}

struct CardView: View {
    
    var isFaceUp = false
    var isMatch = false
    var title: String
    
    var body: some View {
        ZStack() {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.red)
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 5)
                Text(title)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.yellow)
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
