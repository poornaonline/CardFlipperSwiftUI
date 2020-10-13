//
//  CardGame.swift
//  Dev1
//
//  Created by Poorna Jayasinghe on 2020-10-13.
//

import Foundation

class CardGame: ObservableObject {
    
    @Published var holder: [Card] = []
    
    init() {
        populateHolder()
    }
    
    private func populateHolder() {
        let titles = ["P", "O", "R", "N", "A"]
        
        for (index, title) in titles.enumerated() {
            holder.append(Card(id: index, isFaceUp: false, isChosen: false, title: title))
            holder.append(Card(id: (index + titles.count), isFaceUp: false, isChosen: false, title: title))
        }
    }
    
    func chooseCard(card: Card) {
        print("Chosen card \(card.id)")
        var index = 0
        for (i,c) in holder.enumerated() {
            if c.id == card.id {
                index = i
            }
        }
        holder[index].isFaceUp = !holder[index].isFaceUp
    }
}

struct Card: Identifiable {
    var id: Int
    var isFaceUp = false
    var isChosen = false
    var title: String
}
