//
//  TestBase.swift
//  MyLifeUITests
//
//  Created by Adrian Salajan on 4/3/18.
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import XCTest

class TestBase: XCTestCase {
        
    let app = XCUIApplication()
    let screens = Screens()

    override func setUp() {
        // Continue afte failure settings
        continueAfterFailure = false
        // Launch app
        app.launch()
    }
    
    override func tearDown() {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .deleteOnSuccess
        add(attachment)
        app.terminate()
    }
}
