//
//  IgnorioKitError.swift
//  ignorio
//
//  Created by Josef Dolezal on 31/05/2017.
//
//

import Foundation

/// API requests error
///
/// - unknownTypeRequested: Thrown if user entered unknown type name
/// - networkError: Trown when common network error occured
/// - unexpectedResponseFormat: Thrown when API response does not have
/// - requestTimeout: Thrown if the request is not completed in reasonable time
public enum IgnorioKitError: Error, CustomStringConvertible {
    case unknownTypeRequested(type: String)
    case networkError(underlying: Error)
    case unexpectedResponseFormat
    case requestTimeout
    case unknownTypes(types: [String])

    /// String representation of error
    public var description: String {
        switch self {
        case let .unknownTypeRequested(type):
            return "The requested type '\(type)' is unknown."

        case let .networkError(underlying):
            return "An unknown error occured while performing network request: \(underlying.localizedDescription)"

        case .unexpectedResponseFormat:
            return "The format of server response does not have valid format."

        case .requestTimeout:
            return "The request timed out."

        case let .unknownTypes(types):
            return "Following types are not supported: \(types.joined(separator: ", "))."
        }
    }
}
