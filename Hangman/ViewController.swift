//
//  ViewController.swift
//  Hangman
//
//  Created by user on 11/10/16.
//  Copyright © 2016 mathsistor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func guess() {
    }
    
    @IBAction func newWord() {
    }    

}

