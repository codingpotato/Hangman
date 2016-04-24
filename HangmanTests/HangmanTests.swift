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
    
    let EXPECTED_WORD = "Test Word"
    
    var hangman: Hangman!
    
    override func setUp() {
        super.setUp()

        hangman = Hangman(word: EXPECTED_WORD)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTriesAfterInit() {
        XCTAssertEqual(12, hangman.tries)
    }
    
    func testUsedAfterInit() {
        XCTAssertEqual("AEIOU", hangman.used)
    }
    
    func testWordAfterInit() {
        XCTAssertEqual(EXPECTED_WORD, hangman.word)
    }
    
    func testGuessingWordAfterInit() {
        XCTAssertEqual("-e-- -o--", hangman.guessingWord)
    }
    
}
