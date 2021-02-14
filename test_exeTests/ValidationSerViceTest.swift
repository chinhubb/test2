//
//  ValidationSerViceTest.swift
//  test_exeTests
//
//  Created by Jirawat on 14/2/2564 BE.
//

@testable import test_exe
import XCTest

class ValidationSerViceTest: XCTestCase {
    var validation: ValidationService!

    override func setUp() {
        super.setUp()
        validation = ValidationService()
    }

    override func tearDown() {
        validation = nil
        super.tearDown()
    }

    func test_is_valid_username() throws {
        XCTAssertNoThrow(try validation.validateUsername("chin"))
    }

    func test_username_is_nil() throws {
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?

        XCTAssertThrowsError(try validation.validateUsername(nil)) { thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
    }

    func test_username_too_short() throws {
        let expectedError = ValidationError.usernameTooShort
        var error: ValidationError?

        XCTAssertThrowsError(try validation.validateUsername("loc")) { thrownError in
            error = thrownError as? ValidationError
        }

        XCTAssertEqual(expectedError, error)

        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }

    func test_username_too_long() throws {
        let expectedError = ValidationError.usernameTooLong
        var error: ValidationError?
        let username = "very long user name1"

        XCTAssertTrue(username.count == 20)

        XCTAssertThrowsError(try validation.validateUsername(username)) { thrownError in
            error = thrownError as? ValidationError
        }

        XCTAssertEqual(expectedError, error)

        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
}
