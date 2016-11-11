import Foundation

class HangmanGame {
    private let word: String
    var tries: Int
    var guessedWord: String
    var guessedLetters: Set<Character>
    
    var isWon: Bool {
        return guessedWord == word
    }
    
    var isOver: Bool {
        return isWon || tries == 0
    }
    
    init(word: String, tries: Int) {
        self.word = word
        self.tries = tries
        guessedWord = String(repeating: "?", count: word.characters.count)
        guessedLetters = Set<Character>()
    }
    
    func guessLetter(letter: Character) {
        guard !isOver else {
            return
        }
        
        guessedWord = ""
        
        if !word.contains(String(letter)) && !guessedLetters.contains(letter){
            tries -= 1
        }

        guessedLetters.insert(letter)
        for char in word.characters {
            guessedWord = guessedWord + (guessedLetters.contains(char) ? String(char) : "?")
        }
    }
}
