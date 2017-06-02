//
//  APIActions.swift
//  ignorio
//
//  Created by Josef Dolezal on 02/06/2017.
//
//

import Foundation

/// Shared instance for gitignore.io API requests
let provider = GitignoreioProvider()

/// Common API request result handler
///
/// - Parameter result: Result of gitignore.io request
/// - Returns: String representation of server response on success
/// - Throws: IgnorioKit error on failure
func handleResult(_ result: GitignoreioProvider.RequestResult) throws -> String {
    switch result {
    case let .success(data): return data
    case let .failure(error): throw error
    }
}

/// Extracts list of supported types from raw response
///
/// - Parameter list: Raw resrver response representing list
/// - Returns: Types grouped alphabetically
func extractTypes(from list: String) -> [[String]] {
    // First extract lines, then split lines into individual types
    return list.components(separatedBy: "\n")
        .map { $0.components(separatedBy: ",") }
}

/// Fetches `.gitignore` file template for given types
///
/// - Parameter types: Types which are used to create `.gitignore` file template
/// - Returns: Generated file template on success
/// - Throws: IgnorioKitError on failure
public func createGitignore(for types: [String]) throws -> String {
    return try handleResult(provider.create(types: types))
}

/// Lists all supported types for template generating
///
/// - Returns: List of supported types grouped alphabetically
/// - Throws: IgnorioKitError on failure
public func listSupportedTypes() throws -> [[String]] {
    let result = try handleResult(provider.list())

    return extractTypes(from: result)
}

/// Searches for given type in list of supported types
///
/// - Parameter type: Type or part of its name to be searched for
/// - Returns: List of types matching given type
/// - Throws: IgnorioKitError on failure
public func search(for type: String) throws -> [String] {
    let result = try handleResult(provider.list())

    // Flatten alphabetical representation
    let supportedTypes = extractTypes(from: result)
        .flatMap { $0 }

    return supportedTypes.filter { $0.contains(type) }
}
