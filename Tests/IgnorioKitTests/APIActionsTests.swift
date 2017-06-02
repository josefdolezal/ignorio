//
//  APIActionsTests.swift
//  ignorio
//
//  Created by Josef Dolezal on 02/06/2017.
//
//

import XCTest
@testable import IgnorioKit

class APIActionsTests: XCTestCase {

    let listResponse = "macos,xcode,swift\nswiftpm"
    let templateResponse = "### Xcode ###"

    func testExceptionThrownOnFailure() {
        let result = createFailure(with: .requestTimeout)

        XCTAssertThrowsError(try handleResult(result), "Exception should be thrown on failure") { error in
            guard
                let error = error as? IgnorioKitError,
                case .requestTimeout = error
            else {
                XCTFail("Thrown error must be unwrapped from result.")
                return
            }
        }
    }

    func testResponseIsReturnedOnSuccess() {
        let result = createSuccess(with: listResponse)

        XCTAssertNoThrow(try handleResult(result))
    }

    func testListTypesExtraction() {
        let types = extractTypes(from: listResponse)

        XCTAssertEqual(types.count, 2)
        XCTAssertEqual(types[0], ["macos", "xcode", "swift"])
        XCTAssertEqual(types[1], ["swiftpm"])
    }

    func createFailure(with reason: IgnorioKitError) -> GitignoreioProvider.RequestResult {
        return GitignoreioProvider.RequestResult.failure(reason)
    }

    func createSuccess(with response: String) -> GitignoreioProvider.RequestResult {
        return GitignoreioProvider.RequestResult.success(response)
    }
}
