//
//  UknownTypesValidator.swift
//  ignorio
//
//  Created by Josef Dolezal on 04/01/2018.
//

import Foundation

// Default regex matching server error
fileprivate let errorRegex = try! NSRegularExpression(pattern: "^#!! ERROR: ([^ ]+) .*!!#$", options: .anchorsMatchLines)

/// Validates the server response for valid types.
/// If server reported an error, validation fails and the error is thrown.
///
/// - Parameter content: Raw content returned from server
/// - Throws: IgnorioKitError.uknownTypes on validation failure
func unknownTypesValidator(content: String) throws {
    let matches = errorRegex
        .matches(in: content, range: NSRange(location: 0, length: content.count))
        .filter { $0.numberOfRanges > 2 }

    // Check the content for matches
    let typeErrors = matches.flatMap { match in
        guard let range = Range(match.range(at: 1), in: content) else { return nil }

        return String(content[range])
    }

    // Throw an error if there were any matches
    if typeErrors.count > 0 {
        throw IgnorioKitError.unknownTypes(types: typeErrors)
    }
}
