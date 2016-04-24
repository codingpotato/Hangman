//
//  HangmanUITests.swift
//  HangmanUITests
//
//  Created by wangyw on 4/24/16.
//  Copyright © 2016 codingpotato. All rights reserved.
//

import XCTest

class HangmanUITests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launchEnvironment["UITestWord"] = "HELLO WORLD"
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTriesAfterStart() {
        XCTAssertEqual("12", app.staticTexts["triesLabel"].label)
    }
    
    func testLengthAfterStart() {
        XCTAssertEqual("11", app.staticTexts["lengthLabel"].label)
    }
    
    func testUsedAfterStart() {
        XCTAssertEqual("AEIOU", app.staticTexts["usedLabel"].label)
    }
    
    func testWordAfterStart() {
        XCTAssertEqual("-E--O -O---", app.staticTexts["wordLabel"].label)
    }
    
    func testTypeUsedCharacter() {
        app.buttons["A"].tap()
        XCTAssertEqual("11", app.staticTexts["triesLabel"].label)
    }
    
}
