/*
 This source file is part of the Swift.org open source project
 
 Copyright (c) 2014 - 2016 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception
 
 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
 */


import FisherYates
import PlayingCard


public struct Deck {
    private var cards: [Card]

    public static func standard52CardDeck() -> Deck {
        let suits: [Suit] = [.spades, .hearts, .diamonds, .clubs]
        let ranks: [Rank] = [.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace]

        var cards: [Card] = []
        for suit in suits {
            for rank in ranks {
                cards.append(Card(rank: rank, suit: suit))
            }
        }

        return Deck(cards)
    }

    public init(_ cards: [Card]) {
        self.cards = cards
    }

    public mutating func shuffle() {
        cards.shuffleInPlace()
    }

    public mutating func deal() -> Card? {
        guard !cards.isEmpty else { return nil }

        return cards.removeLast()
    }
}

// MARK: - ArrayLiteralConvertible

extension Deck : ArrayLiteralConvertible {
    public init(arrayLiteral elements: Card...) {
        self.init(elements)
    }
}

// MARK: - Equatable

extension Deck : Equatable {}

public func ==(lhs: Deck, rhs: Deck) -> Bool {
    return lhs.cards == rhs.cards
}
