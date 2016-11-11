//
//  HangmanTests.swift
//  HangmanTests
//
//  Created by user on 11/10/16.
//  Copyright © 2016 mathsistor. All rights reserved.
//

import XCTest
@testable import Hangman

class HangmanTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMaskedWordGuessedLettersAndTriesAreUpdatedProperlyCase0() {
        let game = HangmanGame(word: "hello", tries: 7)
        var set = Set<Character>()
        var letter: Character = "h"
        set.insert(letter)
        
        game.guessLetter(letter: letter)
        XCTAssertEqual(game.guessedWord, "h????")
        XCTAssertEqual(game.guessedLetters, set)
        XCTAssertEqual(game.tries, 7)
    }
    
    func testMaskedWordAndGuessedLettersAreUpdatedProperlyCase1() {
        let game = HangmanGame(word: "computer", tries: 7)
        var set = Set<Character>()
        let letter: Character = "x"
        set.insert(letter)
        
        game.guessLetter(letter: letter)
        XCTAssertEqual(game.guessedWord, "????????")
        XCTAssertEqual(game.guessedLetters, set)
        XCTAssertEqual(game.tries, 6)
    }
    
}
