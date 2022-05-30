import ArgumentParser
import IgnorioKit

extension Ignorio {
    struct List: AsyncParsableCommand {
        static var configuration: CommandConfiguration = .init(
            abstract: "List all supported types by gitignore.io"
        )

        var service: GitIgnoreIOService = .live()

        func run() async throws {
            // Fetch supported types
            let types = try await service.list().joined(separator: "\n")
            // Print list of types into stdout
            print(types)
        }

        enum CodingKeys: CodingKey { }
    }
}