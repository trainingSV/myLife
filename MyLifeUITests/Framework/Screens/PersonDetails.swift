//
//  PersonDetails.swift
//  MyLifeUITests
//
//  Created by Adrian Salajan on 8/9/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation
import XCTest

class PersonDetails: ScreenBase {
    lazy var nameTextField = app.textFields.element(matching: NSPredicate(format: "placeholderValue = %@", ElementIdentifiers.Name))
    lazy var textField = app.textFields.element
    lazy var cancelButton = app.buttons[ElementIdentifiers.Cancel]
    lazy var doneButton = app.buttons[ElementIdentifiers.Done]

    override func validateScreen() {
        XCTAssert(textField.waitForExistence(timeout: FrameworkConstants.defaultTimeout))
    }

    override func goToScreen(_ screen: ScreenBase) {
        switch screen {
        case is MyLifeMain:
            tapCancelButton()
        default:
            break
        }
        screen.validateScreen()
    }

    func tapCancelButton() {
        cancelButton.validateAndTap()
    }

    func tapDoneButton() {
        doneButton.validateAndTap()
    }

    func enterName(name: String) {
        nameTextField.tap()
        nameTextField.typeText(name)
        app.textFields.element.typeText("\r")
    }

    func clearName() {
        let element = app.textFields.element
        element.validateAndTap()
        app.keys[ElementIdentifiers.Delete].press(forDuration: 3)
        app.textFields.element.typeText("\r")
    }

    func updateName(name: String) {
        clearName()
        enterName(name: name)
        tapDoneButton()
    }

    func adjustDogLikeSlider(value: Int) {
        // app.sliders.element.adjust(toNormalizedSliderPosition: 0.8)
    }
}
