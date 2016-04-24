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

    private var words = [
        "GUESS", "METHODOLOGY", "WORLD", "VARIOUS", "SPANISH", "GENERATOR"
    ]
    private var hangman: Hangman!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func keyPressed(button: UIButton) {
        let buttonText = button.titleLabel!.text!
        hangman.typeCharacter(buttonText.characters[buttonText.startIndex])
        updateLabels()
        if (hangman.won) {
            showAlert(true)
        } else if (hangman.lose) {
            showAlert(false)
        }
    }
    
    private func start() {
        if let word = NSProcessInfo.processInfo().environment["UITestWord"] {
            hangman = Hangman(word: word)
        } else {
            hangman = Hangman(word: words[randomFromZeroToNumber(words.count)])
        }
        updateLabels()
    }
    
    private func updateLabels() {
        triesLabel.text = "\(hangman.tries)"
        lengthLabel.text = "\(hangman.word.characters.count)"
        usedLabel.text = "\(hangman.used)"
        wordLabel.text = "\(hangman.guessingWord)"
    }
    
    private func showAlert(won: Bool) {
        let title = won ? "You won!" : "You Lose!"
        let message = "Word: \(hangman.word)"
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (alertAction) in
            self.dismissViewControllerAnimated(true, completion: nil)
            self.start()
        }))
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    private func randomFromZeroToNumber(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
}
