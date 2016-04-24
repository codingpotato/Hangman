//
//  Hangman.swift
//  Hangman
//
//  Created by wangyw on 4/24/16.
//  Copyright © 2016 codingpotato. All rights reserved.
//

import Foundation

class Hangman {
    
    var tries = 12
    var used = "AEIOU"

    var word: String
    var guessingWord: String
    
    init(word: String) {
        self.word = word
        guessingWord = ""
        for char in word.characters {
            if used.containsString(String(char).uppercaseString) || char == " " {
                guessingWord += String(char)
            } else {
                guessingWord += "-"
            }
        }
    }
    
}
