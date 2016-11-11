import Foundation

class HangmanGame {
    let word: String
    let tries: Int
    
    init(word: String, tries: Int) {
        self.word = word
        self.tries = tries
    }
}
