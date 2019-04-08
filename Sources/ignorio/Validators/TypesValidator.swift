//
//  TypesValidator.swift
//  ignorio
//
//  Created by Josef Dolezal on 31/05/2017.
//
//

import Commander

/// Validates types argument
///
/// - Parameter types: List of types entered by user
/// - Returns: Sanitized user input
/// - Throws: IgnorioError
func typesValidator(_ types: [String]) throws -> [String] {

    guard types.count > 0 else {
        throw IgnorioError.zeroTypesCount
    }

    return types.compactMap { $0.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) }
}
