//
//  GitignoreioAPI.swift
//  ignorio
//
//  Created by Josef Dolezal on 31/05/2017.
//
//

import Foundation

/// Wrapper for Gitignore.io API
///
/// - create: Requests .gitignore files for given collection of types
/// - list: Returns list of supported types
enum GitignoreioAPI {
    case create(types: [String])
    case list

    /// API base URL
    static let baseURL = URL(string: "https://www.gitignore.io/api/")!

    /// Endpoint path
    var path: String {
        switch self {
        case let .create(types):
            return stringifyTypes(types)
        case .list:
            return "list"
        }
    }

    /// Actual network request
    var request: URLRequest {
        let url = GitignoreioAPI.baseURL.appendingPathComponent(path)

        return URLRequest(url: url)
    }

    /// Creates URL friendly list of types from given collection
    ///
    /// - Parameter types: Collection of types
    /// - Returns: String representation of collection
    private func stringifyTypes(_ types: [String]) -> String {
        return types.joined(separator: ",")
    }
}
