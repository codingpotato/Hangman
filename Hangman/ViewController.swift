//
//  ViewController.swift
//  Hangman
//
//  Created by wangyw on 4/24/16.
//  Copyright © 2016 codingpotato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var triesLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var usedLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    
    private var hangman: Hangman!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let word = NSProcessInfo.processInfo().environment["UITestWord"] {
            hangman = Hangman(word: word)
        } else {
            hangman = Hangman(word: "Guess this word")
        }
        triesLabel.text = "\(hangman.tries)"
        lengthLabel.text = "\(hangman.word.characters.count)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func keyPressed(button: UIButton) {
    }
    
}

