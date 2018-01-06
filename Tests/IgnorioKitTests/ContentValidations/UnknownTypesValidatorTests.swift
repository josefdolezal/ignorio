//
//  UnknownTypesValidatorTests.swift
//  IgnorioKitTests
//
//  Created by Josef Dolezal on 04/01/2018.
//

import XCTest
@testable import IgnorioKit

class UnknownTypesValidatorTests: XCTestCase {
    func testValidatorThrowsOnError() throws {
        let content = """
        # Created by https://www.gitignore.io/api/swyft,cxode

        #!! ERROR: cxode is undefined. Use list command to see defined gitignore types !!#

        #!! ERROR: swyft is undefined. Use list command to see defined gitignore types !!#

        # End of https://www.gitignore.io/api/swyft,cxode
        """

        XCTAssertThrowsError(try unknownTypesValidator(content: content), "The validator should throw on failure.") { error in
            guard case let IgnorioKitError.unknownTypes(types) = error else {
                XCTFail("Unexpected exception thrown.")
                return
            }

            XCTAssertEqual(types.count, 2)
            XCTAssertEqual(types[0], "cxode")
            XCTAssertEqual(types[1], "swyft")
        }
    }

    func testValidatorSucceedsForValidInput() {
        let content = """
        # Created by https://www.gitignore.io/api/swift

        ## Build generated
        build/
        DerivedData/

        # End of https://www.gitignore.io/api/swift
        """

        XCTAssertNoThrow(try unknownTypesValidator(content: content), "Should not throw when succeeds.")
    }
}
