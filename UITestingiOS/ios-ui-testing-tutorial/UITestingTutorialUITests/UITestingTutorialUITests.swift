//
//  UITestingTutorialUITests.swift
//  UITestingTutorialUITests
//
//  Created by JEONGSEOB HONG on 2021/04/13.
//  Copyright © 2021 Code Pro. All rights reserved.
//

import XCTest

class UITestingTutorialUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidLoginSuccess() {
        
        let validPassword = "abc123"
        let validUserName = "CodePro"
        
        let app = XCUIApplication()
        
                let userNameTextField = app.textFields["Username"]
                XCTAssertTrue(userNameTextField.exists)
        
        let profileButton = app.navigationBars["Mockify Music"].buttons["Profile"]
        XCTAssertTrue(profileButton.exists)
        profileButton.tap()
                        
                                        
                        
        
    }
    
    func testFirst() {
        
        let app = XCUIApplication()
        app.textFields["Username"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Missing Credentials"].scrollViews.otherElements.buttons["Ok"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        
    }
    
}
