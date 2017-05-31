//
//  CreateCommand.swift
//  ignorio
//
//  Created by Josef Dolezal on 31/05/2017.
//
//

import Foundation
import Commander
import Result
import IgnorioKit

let createCommand = command(
    VariadicArgument<String>("TYPES", description: "Collection of types separated with space",
                             validator: typesValidator)
) { types in
    try commonResult { $0.create(types: types) }
}
