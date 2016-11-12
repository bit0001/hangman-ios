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
    
    var game: HangmanGame!
    var words = readWords() ?? ["hangman"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func guess() {
    }
    
    @IBAction func newWord() {
    }    

}

