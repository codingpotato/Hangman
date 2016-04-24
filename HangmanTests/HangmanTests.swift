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
        XCTAssertEqual(allVowel, hangman.used)
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
    }
    
    func testTypeCorrectCharacter() {
        hangman.typeCharacter("T")
        XCTAssertEqual("TE-T -O--", hangman.guessingWord)
    }
    
    func testTypeIncorrectCharacter() {
        let incorrectCharacter = "Z"
        hangman.typeCharacter(incorrectCharacter[incorrectCharacter.startIndex])
        XCTAssertEqual(maxTries - 1, hangman.tries)
        XCTAssertEqual(allVowel + incorrectCharacter, hangman.used)
    }
    
    func testWin() {
        hangman.typeCharacter("T")
        hangman.typeCharacter("S")
        hangman.typeCharacter("W")
        hangman.typeCharacter("R")
        hangman.typeCharacter("D")
        XCTAssert(hangman.won)
    }
    
    func testLose() {
        for _ in 0..<maxTries {
            hangman.typeCharacter("M")
        }
        XCTAssert(hangman.lose)
    }
    
}
