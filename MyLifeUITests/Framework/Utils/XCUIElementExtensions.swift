//
//  XCUIElementExtensions.swift
//  MyLifeUITests
//
//  Created by Adrian Salajan on 7/17/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation
import XCTest

class XCUIElementExtensions {
}

extension XCUIElement {

    func validateAndTap() {
        XCTAssert(self.waitForExistence(timeout: FrameworkConstants.defaultTimeout))
        self.tap()
    }

    open func adjustSlider(toNormalizedSliderValue normalizedSliderValue: CGFloat) {
        let start = coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0))
        let end = coordinate(withNormalizedOffset: CGVector(dx: normalizedSliderValue, dy: 0.0))
        start.press(forDuration: 0.05, thenDragTo: end)
    }

}

extension XCUIElementQuery {

    func labels() -> [String] {
        var labelValues = [String]()
        let elements = allElementsBoundByIndex
        for element in elements {
            labelValues.append(element.label)
        }
        return labelValues
    }

    func identifiers() -> [String] {
        var labelValues = [String]()
        let elements = allElementsBoundByIndex
        for element in elements {
            labelValues.append(element.identifier)
        }
        return labelValues
    }

    func values() -> [String] {
        var elementsValues = [String]()
        let elements = allElementsBoundByIndex
        for element in elements {
            if let value = element.value as? String , value != "" {
                elementsValues.append(value)
            }
        }
        return elementsValues
    }

}
