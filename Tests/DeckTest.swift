/*
 This source file is part of the Swift.org open source project
 
 Copyright (c) 2014 - 2016 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception
 
 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
*/


import XCTest

@testable import PlayingCard
@testable import DeckOfPlayingCards

class DeckTest: XCTestCase {
    

    func standard52CardDeck(){
        let ranks = [2,3,4,5,6,7,8,9,10,11,12,13,14].map{Rank(rawValue: $0)}.flatMap{$0}
        let suits = ["spades", "hearts", "diamonds", "clubs"].map{Suit(rawValue: $0)}.flatMap{$0}
        let standard = zip(suits, ranks).map({Card(rank: $0.1, suit: $0.0)}).sorted()
        
        XCTAssertEqual(Deck.standard52CardDeck(), Deck(standard))
    
    }
    
}