//
//  CreateCommand.swift
//  ignorio
//
//  Created by Josef Dolezal on 31/05/2017.
//
//

import Commander
import IgnorioKit

let createCommand = command(
    VariadicArgument<String>("TYPES", description: "Collection of types separated with space",
                             validator: typesValidator)
) { types in
    
}
