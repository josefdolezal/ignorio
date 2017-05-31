//
//  TypesValidator.swift
//  ignorio
//
//  Created by Josef Dolezal on 31/05/2017.
//
//

import Commander

func typesValidator(_ types: [String]) throws -> [String] {

    guard types.count > 0 else {
        throw IgnorioError.zeroTypesCount
    }

    return types.flatMap({ $0.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) })
}
