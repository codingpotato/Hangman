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
            if isCharacterUsed(character) || character == " " {
                guessingWord += String(character)
            } else {
                guessingWord += "-"
            }
        }
    }
    
    func typeCharacter(character: Character) {
        if isCharacterUsed(character) {
            tries -= 1
        } else {
            let wordCharacters = Array(word.characters)
            var guessingWordCharacters = Array(guessingWord.characters)
            var foundCharacter = false
            for (index, char) in wordCharacters.enumerate() {
                if char == character {
                    guessingWordCharacters[index] = character
                    foundCharacter = true
                }
            }
            if foundCharacter {
                guessingWord = String(guessingWordCharacters)
            } else {
                tries -= 1
                used += String(character)
            }
        }
    }
    
    private func isCharacterUsed(character: Character) -> Bool {
        return used.characters.contains(character)
    }
    
}
