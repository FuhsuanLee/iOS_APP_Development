//
//  MatchingGame.swift
//  game
//
//  Created by Sherry Lee on 2026/3/24.
//

import Foundation

class MatchingGame {
    var cards: Array<Card>=[]
    
    func chooseCard(at index: Int) -> Card {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
            return cards[index]
    }
    
    init(numberOfPairsCards: Int) {
        for _ in 1...numberOfPairsCards{
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
    }
}
