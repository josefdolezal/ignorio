import ArgumentParser
import IgnorioKit

extension Ignorio {
    struct Generate: AsyncParsableCommand {
        static let configuration: CommandConfiguration = .init(
            abstract: "Generate .gitignore template for given collection of types"
        )

        @Argument(help: "Collection of types separated with space")
        var types: [String]

        func run() async throws {
            // Fetch the requested types
            let gitignore = try createGitignore(for: types)

            // Run the content validation
            try unknownTypesValidator(content: gitignore)

            // Output the validated content to stdout
            print(gitignore)
        }
    }
}