//
//  File.swift
//  
//
//  Created by Josef Dolezal on 28/02/2020.
//

import ArgumentParser
import IgnorioKit

struct IgnorioCLI: ParsableCommand {
    static var configuration: CommandConfiguration = .init(
        abstract: "A tool",
        subcommands: [Create.self, List.self, Search.self]
    )
}

extension IgnorioCLI {
    struct Create: ParsableCommand {
        static var configuration: CommandConfiguration = .init(abstract: "Fetch .gitignore file for collection of types")
        
        @Argument(help: "Collection of types separated with space")
        var types: [String]

        func run() throws {
            // Fetch the requested types
            let gitignore = try createGitignore(for: types)

            // Run the content validation
            try unknownTypesValidator(content: gitignore)

            // Output the validated content to stdout
            print(gitignore)
        }
    }
}

extension IgnorioCLI {
    struct List: ParsableCommand {
        static var configuration: CommandConfiguration = .init(abstract: "List all supported types by gitignore.io")

        func run() throws {
            let alphabeticList = try listSupportedTypes()
            let list = alphabeticList
                .map { $0.joined(separator: ",") }
                .joined(separator: "\n")

            print(list)
        }
    }
}

extension IgnorioCLI {
    struct Search: ParsableCommand {
        static var configuration: CommandConfiguration = .init(abstract: "Search for type in list of supported types")

        @Argument(help: "Search for TYPE in available types at gitignore.io")
        var type: String

        func run() throws {
            let matches = try search(for: type)

            if matches.count > 0 {
                print("Found \(matches.count) results for `\(type)`:")
                print(matches.joined(separator: " "))
            } else {
                print("No match for `\(type)`.")
            }
        }
    }
}
