//
//  test_UI_ex.swift
//  test_exeUITests
//
//  Created by Jirawat on 16/2/2564 BE.
//

import XCTest

class login_ui_test: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
        
        XCUIApplication().launch()
    }

    func testValidloginSuccess() {
        let validaUsername = "chin"
        let validPassword = "abcd123"

        let app = XCUIApplication()

        let usernameTextField = app.textFields["usernameTextField"]
        XCTAssertTrue(usernameTextField.exists)
        usernameTextField.tap()
        usernameTextField.typeText(validaUsername)

        let passwordTextField = app.secureTextFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText(validPassword)

        app.buttons["Login"].tap()
        
    }
}
