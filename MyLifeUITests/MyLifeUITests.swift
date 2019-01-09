//
//  MyLifeUITests.swift
//  MyLifeUITests
//
//  Created by George Galan on 09/01/2019.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import XCTest

class MyLifeUITests: TestBase {

    func testAddNewPerson() {
        let newPersonName = "New User"

        // Tap on add a new person button from Home Screen
        screens.home.goToScreen(screens.addNewPerson)

        // Add a new person and tap Done to return to Home Screen
        screens.addNewPerson.addPerson(name: newPersonName)
        screens.home.validateScreen()

        //Verify new person displayed in Home screen
        XCTAssertTrue(screens.home.isPersonDisplayed(name: newPersonName), "New Person has not been added")
    }


    func testUpdatePersonName() {
        let updatedName = "Updated User Name"

        // Tap on the first person in the list
        screens.home.selectPerson(atIndex: 0)
        screens.personDetails.validateScreen()

        //Update name and tap Done
        screens.personDetails.updateName(name: updatedName)
        screens.home.validateScreen()

        // Check if person with updated name is present in Home Screen
        XCTAssertTrue(screens.home.isPersonDisplayed(name: updatedName), "Person name has not been updated")
        }
}




