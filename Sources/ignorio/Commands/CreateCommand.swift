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

/// Command for .gitignore file fetch
let createCommand = command(
    VariadicArgument<String>("TYPES", description: "Collection of types separated with space",
                             validator: typesValidator)
) { types in
    // Fetch the requested types
    let gitignore = try createGitignore(for: types)

    // Run the content validation
    try unknownTypesValidator(content: gitignore)

    // Output the validated content to stdout
    print(gitignore)
}
