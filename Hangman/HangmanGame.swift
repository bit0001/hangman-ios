import Foundation

class HangmanGame {
    let word: String
    let tries: Int
    var guessedWord: String
    var guessedLetters: Set<Character>
    
    init(word: String, tries: Int) {
        self.word = word
        self.tries = tries
        guessedWord = String(repeating: "?", count: word.characters.count)
        guessedLetters = Set<Character>()
    }
    
}
