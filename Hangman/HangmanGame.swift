import Foundation

class HangmanGame {
    private let word: String
    var tries: Int
    var guessedWord: String
    var guessedLetters: Set<Character>
    
    init(word: String, tries: Int) {
        self.word = word
        self.tries = tries
        guessedWord = String(repeating: "?", count: word.characters.count)
        guessedLetters = Set<Character>()
    }
    
    func guessLetter(letter: Character) {
        guessedWord = ""
        guessedLetters.insert(letter)
        for char in word.characters {
            guessedWord = guessedWord + (guessedLetters.contains(char) ? String(char) : "?")
        }
        
        if !word.contains(String(letter)) {
            tries -= 1
        }
    }
}
