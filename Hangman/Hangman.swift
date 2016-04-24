//
//  Hangman.swift
//  Hangman
//
//  Created by wangyw on 4/24/16.
//  Copyright © 2016 codingpotato. All rights reserved.
//

import Foundation

class Hangman {
    
    let hiddenCharacter = "-"
    let space: Character = " "
    
    var won: Bool {
        return word == guessingWord
    }
    
    var lose: Bool {
        return tries == 0
    }
    
    var tries = 12
    var usedCharacters = "AEIOU"

    var word: String
    var guessingWord: String
    
    init(word: String) {
        self.word = word
        guessingWord = ""
        initGuessingWord()
    }
    
    func typeCharacter(character: Character) {
        guard !won && !lose else { return }
        
        if isCharacterUsed(character) {
            tries -= 1
        } else {
            checkGuessCharacter(character)
        }
    }
    
    private func initGuessingWord() {
        for character in word.characters {
            if isCharacterUsed(character) || character == space {
                guessingWord += String(character)
            } else {
                guessingWord += hiddenCharacter
            }
        }
    }
    
    private func checkGuessCharacter(character: Character) {
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
            usedCharacters += String(character)
        }
    }
    
    private func isCharacterUsed(character: Character) -> Bool {
        return usedCharacters.characters.contains(character)
    }
    
}
