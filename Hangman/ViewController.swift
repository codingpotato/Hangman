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
    
    private let hangman = Hangman()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        triesLabel.text = "\(hangman.tries)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func keyPressed(button: UIButton) {
    }
    
}

