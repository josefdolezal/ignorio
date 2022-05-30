import ArgumentParser
import IgnorioKit

extension Ignorio {
    struct Generate: AsyncParsableCommand {
        static let configuration: CommandConfiguration = .init(
            abstract: "Generate .gitignore template for given collection of types"
        )

        @Argument(help: "Collection of types separated with space")
        var types: [String]
        var service: GitIgnoreIOService = .live()

        func run() async throws {
            // Fetch temaplate
            let template = try await service.generate(types)
            // Print result into stdout
            print(template)
        }

        enum CodingKeys: String, CodingKey {
            case types
        }
    }
}