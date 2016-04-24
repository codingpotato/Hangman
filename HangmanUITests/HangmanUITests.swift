//
//  HangmanUITests.swift
//  HangmanUITests
//
//  Created by wangyw on 4/24/16.
//  Copyright © 2016 codingpotato. All rights reserved.
//

import XCTest

class HangmanUITests: XCTestCase {
    
    let triesLabelName = "triesLabel"
    let lengthLabelName = "lengthLabel"
    let usedLabelName = "usedLabel"
    let wordLabelName = "wordLabel"
    let allVowel = "AEIOU"
    let word = "HELLO WORLD"
    let initialGuessingWord = "-E--O -O---"
    let incorrectCharacter = "Z"
    let wonCharacters = "HLWRD"
    let wonAlertTitle = "You won!"
    
    let maxTries = 12
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launchEnvironment["UITestWord"] = word
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTriesAfterStart() {
        XCTAssertEqual("\(maxTries)", app.staticTexts[triesLabelName].label)
    }
    
    func testLengthAfterStart() {
        XCTAssertEqual("\(maxTries - 1)", app.staticTexts[lengthLabelName].label)
    }
    
    func testUsedAfterStart() {
        XCTAssertEqual(allVowel, app.staticTexts[usedLabelName].label)
    }
    
    func testWordAfterStart() {
        XCTAssertEqual(initialGuessingWord, app.staticTexts[wordLabelName].label)
    }
    
    func testTypeUsedCharacter() {
        app.buttons["A"].tap()
        XCTAssertEqual("\(maxTries - 1)", app.staticTexts[triesLabelName].label)
    }
    
    func testTypeCorrectCharacter() {
        app.buttons["L"].tap()
        XCTAssertEqual("-ELLO -O-L-", app.staticTexts[wordLabelName].label)
    }
    
    func testTypeIncorrectCharacter() {
        app.buttons[incorrectCharacter].tap()
        XCTAssertEqual("\(maxTries - 1)", app.staticTexts[triesLabelName].label)
        XCTAssertEqual(allVowel + incorrectCharacter, app.staticTexts[usedLabelName].label)
    }
    
    func testWin() {
        for character in wonCharacters.characters {
            app.buttons[String(character)].tap()
        }
        XCTAssertEqual(word, app.staticTexts[wordLabelName].label)
        XCTAssert(app.alerts[wonAlertTitle].exists)
    }
    
    func testLose() {
        for _ in 0..<maxTries {
            app.buttons[incorrectCharacter].tap()
        }
        XCTAssertEqual("0", app.staticTexts[triesLabelName].label)
        XCTAssert(app.alerts["You Lose!"].exists)
    }
    
    func testRestart() {
        for character in wonCharacters.characters {
            app.buttons[String(character)].tap()
        }
        app.alerts[wonAlertTitle].buttons["OK"].tap()
        XCTAssertEqual(initialGuessingWord, app.staticTexts[wordLabelName].label)
    }
    
}
