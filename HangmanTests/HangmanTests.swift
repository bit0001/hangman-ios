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
    
    func testWinningCase0() {
        var set = Set<Character>()
        var letter: Character = "h"
        
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "h??", expectedSet: set, expectedTries: 3)

        letter = "m"
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "h?m", expectedSet: set, expectedTries: 3)

        letter = "i"
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "him", expectedSet: set, expectedTries: 3)
    }
    
    func testWinningCase1() {
        var set = Set<Character>()
        var letter: Character = "h"
        
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "h??", expectedSet: set, expectedTries: 3)
        
        
        letter = "x"
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "h??", expectedSet: set, expectedTries: 2)
        
        letter = "m"
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "h?m", expectedSet: set, expectedTries: 2)
        
        letter = "m"
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "h?m", expectedSet: set, expectedTries: 2)
        
        letter = "x"
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "h?m", expectedSet: set, expectedTries: 2)
        
        letter = "y"
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "h?m", expectedSet: set, expectedTries: 1)
        
        letter = "z"
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "h?m", expectedSet: set, expectedTries: 0)
        
        letter = "i"
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "him", expectedSet: set, expectedTries: 0)
    }
    
    func testLosingCase0() {
        var set = Set<Character>()
        var letter: Character = "x"
        set.insert(letter)
    
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "???", expectedSet: set, expectedTries: 2)
        
        letter = "y"
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "???", expectedSet: set, expectedTries: 1)
        
        letter = "z"
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "???", expectedSet: set, expectedTries: 0)
    }
    
    func testLosingCase1() {
        var set = Set<Character>()
        var letter: Character = "h"
        set.insert(letter)
        
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "h??", expectedSet: set, expectedTries: 3)
        
        letter = "i"
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "hi?", expectedSet: set, expectedTries: 3)
        
        letter = "y"
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "hi?", expectedSet: set, expectedTries: 2)
        
        letter = "z"
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "hi?", expectedSet: set, expectedTries: 1)
        
        letter = "x"
        set.insert(letter)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "hi?", expectedSet: set, expectedTries: 0)
    }
    
    func testTriesAreNotReducedIfGuessedLetterHasPreviouslyGuessed() {
        var set = Set<Character>()
        let letter: Character = "x"
        set.insert(letter)
        
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "???", expectedSet: set, expectedTries: 2)
        game.guessLetter(letter: letter)
        assertGame(game: game, expectedString: "???", expectedSet: set, expectedTries: 2)
    }
    
    func testGameIsWonWhenWordWasGuessed() {
        game = HangmanGame(word: "me", tries: 2)
        game.guessLetter(letter: "m")
        game.guessLetter(letter: "e")
        XCTAssertTrue(game.isWon)
    }
    
    func testGameIsNotWonWhenWordHasntBeenGuessedYet() {
        game = HangmanGame(word: "me", tries: 2)
        game.guessLetter(letter: "e")
        XCTAssertFalse(game.isWon)
    }
    
    func testGameIsOverIfWordWasGuessed() {
        game = HangmanGame(word: "me", tries: 2)
        game.guessLetter(letter: "m")
        game.guessLetter(letter: "e")
        XCTAssertTrue(game.isOver)
    }
    
    func testGAmeIsOverIfNoMoreTries() {
        game = HangmanGame(word: "me", tries: 1)
        game.guessLetter(letter: "u")
        XCTAssertTrue(game.isOver)
    }
    
    func testGameIsNotOverIfTriesIsNotZeroAndWordIsNotGuessedYet() {
        game = HangmanGame(word: "me", tries: 2)
        game.guessLetter(letter: "u")
        XCTAssertFalse(game.isOver)
    }
    
    func testTriesAreNotReducedIfNoMoreTries() {
        game = HangmanGame(word: "me", tries: 1)
        game.guessLetter(letter: "u")
        game.guessLetter(letter: "p")
        XCTAssertEqual(game.tries, 0)
    }

    private func assertGame(game: HangmanGame, expectedString: String, expectedSet: Set<Character>, expectedTries: Int) {
        XCTAssertEqual(game.guessedWord, expectedString)
        XCTAssertEqual(game.guessedLetters, expectedSet)
        XCTAssertEqual(game.tries, expectedTries)
    }
    
}
