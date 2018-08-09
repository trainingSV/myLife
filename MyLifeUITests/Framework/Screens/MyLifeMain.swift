//
//  MyLifeMain.swift
//  MyLifeUITests
//
//  Created by Adrian Salajan on 4/3/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//
import Foundation
import XCTest

class MyLifeMain: ScreenBase {

    lazy var myLifeStatusBarElement = app.navigationBars.otherElements[ElementIdentifiers.MyLife]
    lazy var addButton = app.buttons[ElementIdentifiers.Add]

    override func validateScreen() {
        XCTAssert(myLifeStatusBarElement.waitForExistence(timeout: FrameworkConstants.defaultTimeout), "My Life main screen not displayed")
    }

    override func goToScreen(_ screen: ScreenBase) {
        switch screen {
        case is AddNewPerson:
            tapAddButton()
        case is PersonDetails:
            selectPerson(atIndex: 0)
        default:
            break
        }
        screen.validateScreen()
    }

    func tapAddButton() {
        _ = addButton.waitForExistence(timeout: FrameworkConstants.defaultTimeout)
        addButton.tap()
    }

    func isPersonDisplayed(name: String) -> Bool {
        return app.tables.cells.staticTexts[name].waitForExistence(timeout: FrameworkConstants.defaultTimeout)
    }

    func selectPerson(name: String) {
        app.tables.cells.staticTexts[name].validateAndTap()
    }

    func selectPerson(atIndex: Int) {
        app.tables.cells.element(boundBy: atIndex).validateAndTap()
    }
}
