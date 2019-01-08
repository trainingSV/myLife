//
//  MyLifeUITests.swift
//  MyLifeUITests
//
//  Created by George Galan on 08/01/2019.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import XCTest

class MyLifeUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        app.terminate()
    }

    func testExample1() {

        let NavigationBar = app.navigationBars["My Life"]
        let PersonNavigationBar = app.navigationBars["MyLife.PersonView"]
        let tables = app.tables
        let nameTextField = tables.textFields["Name"]
        let name = "New User"

        // Tap on Add a new person
        NavigationBar.buttons["Add"].tap()
        XCTAssertTrue(nameTextField.exists, "Wrong screen buddy")

        // Tape on "Name" field
        nameTextField.tap()
        nameTextField.typeText(name)

        // Tap on "Done" button and verify person has been added
        PersonNavigationBar.buttons["Done"].tap()
        XCTAssertTrue(NavigationBar.exists, "Wrong screen buddy")
        XCTAssertTrue(tables.staticTexts[name].exists,"New Person not added")

}

    func testExample2() {

    let NavigationBar = app.navigationBars["My Life"]
    let tables = app.tables
    let nameTextField = tables.textFields.firstMatch
    let newName = "Updated Name"

    // Select a person

    tables.staticTexts.element(boundBy: 0).tap()

    // Tape on "Name" field and update name
    nameTextField.tap()
    let deleteKey = app.keys["delete"]
    deleteKey.press(forDuration: 3)
    nameTextField.typeText(newName)

    // Tap on "Done" button and verify person has been added

    NavigationBar.buttons["Done"].tap()
    XCTAssertTrue(NavigationBar.exists, "Wrong screen buddy")
    XCTAssertTrue(tables.staticTexts[newName].exists,"Name not updated")

}

}














