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
    var game: HangmanGame!
    
    override func setUp() {
        game = HangmanGame(word: "him", tries: 3)
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMaskedWordGuessedLettersAndTriesAreUpdatedProperlyCase0() {
        var set = Set<Character>()
        let letter: Character = "h"
        set.insert(letter)
        
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "h??", expectedSet: set, expectedTries: 3)
    }
    
    func testMaskedWordAndGuessedLettersAreUpdatedProperlyCase1() {
        var set = Set<Character>()
        let letter: Character = "x"
        set.insert(letter)
        
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "???", expectedSet: set, expectedTries: 2)
    }
    
    private func assertGame(game: HangmanGame, expectedString: String, expectedSet: Set<Character>, expectedTries: Int) {
        XCTAssertEqual(game.guessedWord, expectedString)
        XCTAssertEqual(game.guessedLetters, expectedSet)
        XCTAssertEqual(game.tries, expectedTries)
    }
    
}
