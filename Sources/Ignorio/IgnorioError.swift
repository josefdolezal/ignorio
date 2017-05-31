//
//  IgnorioError.swift
//  ignorio
//
//  Created by Josef Dolezal on 31/05/2017.
//
//

import Foundation

enum IgnorioError: Error, CustomStringConvertible {
    case zeroTypesCount

    var description: String {
        switch self {
        case .zeroTypesCount: return "Error: You must specify at least one type to fetch .gitignore file."
        }
    }
}
