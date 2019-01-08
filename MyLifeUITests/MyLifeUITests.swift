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

    func testAddNewPerson() {
    let navigationBar = app.navigationBars["My Life"]
    let personNavigationBar = app.navigationBars["MyLife.PersonView"]
    let tableView = app.tables
    let nameTextField = tableView.textFields["Name"]
    let name = "New User"

    // Tap on Add a new person
    navigationBar.buttons["Add"].tap()
    XCTAssertTrue(nameTextField.waitForExistence(timeout: 2), "The Add New Person Screen has not been reached")

    // Tape on "Name" field
    nameTextField.tap()
    nameTextField.typeText(name)

    // Tap on "Done" button and verify person has been added
    personNavigationBar.buttons["Done"].tap()
    XCTAssertTrue(navigationBar.waitForExistence(timeout: 2), "The Home Screen has not been reached")
    XCTAssertTrue(tableView.staticTexts[name].waitForExistence(timeout: 2), "New Person not added")
    }

    func testUpdatePersonName() {
    let navigationBar = app.navigationBars["My Life"]
    let tableView = app.tables
    let nameTextField = tableView.textFields.firstMatch
    let newName = "Updated Name"

    // Select a person
    tableView.staticTexts.element(boundBy: 0).tap()

    // Tape on "Name" field and update name
    nameTextField.tap()
    let deleteKey = app.keys["delete"]
    deleteKey.press(forDuration: 3)
    nameTextField.typeText(newName)

    // Tap on "Done" button and verify person with updated name is present
    navigationBar.buttons["Done"].tap()
    XCTAssertTrue(navigationBar.waitForExistence(timeout: 2), "The Home Screen has not been reached")
    XCTAssertTrue(tableView.staticTexts[newName].waitForExistence(timeout: 2), "Name has not been updated")
    }

}














