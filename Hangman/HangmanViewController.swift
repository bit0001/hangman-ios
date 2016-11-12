//
//  ViewController.swift
//  Hangman
//
//  Created by user on 11/10/16.
//  Copyright © 2016 mathsistor. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var guessedLettersLabel: UILabel!
    @IBOutlet weak var guessesLeftLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    
    let NumberOfTries = 10
    var game: HangmanGame!
    var words = readWords() ?? ["hangman"]
    
    let images:[Int: UIImage] = [
        10: UIImage(named:"hangman0")!,
        9:  UIImage(named: "hangman1")!,
        8:  UIImage(named: "hangman2")!,
        7:  UIImage(named: "hangman3")!,
        6:  UIImage(named: "hangman4")!,
        5:  UIImage(named: "hangman5")!,
        4:  UIImage(named: "hangman6")!,
        3:  UIImage(named: "hangman7")!,
        2:  UIImage(named: "hangman8")!,
        1:  UIImage(named: "hangman9")!,
        0:  UIImage(named: "hangman10")!,
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        game = HangmanGame(word: getRandomWord(), tries: NumberOfTries)
        wordLabel.text = game.guessedWord
    }
    
    @IBAction func guess() {
        if let letter = guessTextField.text {
            guard letter.characters.count == 1 else {
                guessTextField.text = ""
                return
            }
            game.guessLetter(letter: Character(letter))
            updateUI()
        }
        guessTextField.text = ""
    }
    
    private func updateUI() {
        if game.isOver {
            feedbackLabel.isHidden = false
            feedbackLabel.text = game.isWon ? "You Win!" : "You Lose!"
        } else {
            feedbackLabel.isHidden = true
        }

        wordLabel.text = game.guessedWord
        guessedLettersLabel.text = "You have guessed: " + String(game.guessedLetters)
        guessesLeftLabel.text = "(\(game.tries) guesses remaining)"
        hangmanImage.image = images[game.tries]
        guessTextField.text = ""
    }
    
    @IBAction func newWord() {
        game = HangmanGame(word: getRandomWord(), tries: NumberOfTries)
        updateUI()
    }
    
    private func getRandomWord() -> String {
        return words[Int(arc4random_uniform(UInt32(words.count)))]
    }

}

