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
    }
    
    @IBAction func guess() {
    }
    
    @IBAction func newWord() {
    }    

}

