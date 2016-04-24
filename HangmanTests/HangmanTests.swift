//
//  HangmanTests.swift
//  HangmanTests
//
//  Created by wangyw on 4/24/16.
//  Copyright © 2016 codingpotato. All rights reserved.
//

import XCTest
@testable import Hangman

class HangmanTests: XCTestCase {
    
    let expectedWord = "TEST WORD"
    let allVowel = "AEIOU"
    let wonCharacters = "TSWRD"
    let incorrectCharacter: Character = "Z"
    let maxTries = 12
    
    var hangman: Hangman!
    
    override func setUp() {
        super.setUp()

        hangman = Hangman(word: expectedWord)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTriesAfterInit() {
        XCTAssertEqual(maxTries, hangman.tries)
    }
    
    func testUsedAfterInit() {
        XCTAssertEqual(allVowel, hangman.usedCharacters)
    }
    
    func testWordAfterInit() {
        XCTAssertEqual(expectedWord, hangman.word)
    }
    
    func testGuessingWordAfterInit() {
        XCTAssertEqual("-E-- -O--", hangman.guessingWord)
    }
    
    func testTypeUsedCharacter() {
        hangman.typeCharacter("E")
        XCTAssertEqual(maxTries - 1, hangman.tries)
        XCTAssertEqual(allVowel, hangman.usedCharacters)
    }
    
    func testTypeCorrectCharacter() {
        hangman.typeCharacter("T")
        XCTAssertEqual("TE-T -O--", hangman.guessingWord)
        XCTAssertEqual(allVowel, hangman.usedCharacters)
    }
    
    func testTypeIncorrectCharacter() {
        hangman.typeCharacter(incorrectCharacter)
        XCTAssertEqual(maxTries - 1, hangman.tries)
        XCTAssertEqual(allVowel + String(incorrectCharacter), hangman.usedCharacters)
    }
    
    func testWin() {
        for character in wonCharacters.characters {
            hangman.typeCharacter(character)
        }
        XCTAssert(hangman.won)
    }
    
    func testLose() {
        for _ in 0..<maxTries {
            hangman.typeCharacter(incorrectCharacter)
        }
        XCTAssert(hangman.lose)
    }
    
}
