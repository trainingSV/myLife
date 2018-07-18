//
//  AddNewPerson.swift
//  MyLifeUITests
//
//  Created by Adrian Salajan on 4/3/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation
import XCTest

class AddNewPerson: ScreenBase {

    lazy var nameTextField = app.textFields.element(matching: NSPredicate(format: "placeholderValue = %@", ElementIdentifiers.Name))
    lazy var cancelButton = app.buttons[ElementIdentifiers.Cancel]
    lazy var doneButton = app.buttons[ElementIdentifiers.Done]

    override func validateScreen() {
        XCTAssert(nameTextField.waitForExistence(timeout: FrameworkConstants.defaultTimeout))
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

    func adjustDogLikeSlider(value: Int) {
       // app.sliders.element.adjust(toNormalizedSliderPosition: 0.8)
    }

    func addPerson(name: String, dogLikeMeter: Int = 5) {
        enterName(name: name)
        adjustDogLikeSlider(value: dogLikeMeter)
        tapDoneButton()
    }
}
