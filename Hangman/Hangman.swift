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
        for character in word.characters {
            if isCharacterInUsed(character) || character == " " {
                guessingWord += String(character)
            } else {
                guessingWord += "-"
            }
        }
    }
    
    func typeCharacter(character: Character) {
        if isCharacterInUsed(character) {
            tries -= 1
        }
    }
    
    func isCharacterInUsed(character: Character) -> Bool {
        return used.characters.contains(character)
    }
    
}
