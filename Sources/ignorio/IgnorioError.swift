//
//  IgnorioError.swift
//  ignorio
//
//  Created by Josef Dolezal on 31/05/2017.
//
//

import Foundation

/// Errors occured in command line interface
///
/// - zeroTypesCount: Thrown if no argument is given
enum IgnorioError: Error, CustomStringConvertible {
    case zeroTypesCount

    var description: String {
        switch self {
        case .zeroTypesCount: return "Error: You must specify at least one type to fetch .gitignore file."
        }
    }
}
