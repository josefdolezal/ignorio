import ArgumentParser
import IgnorioKit

extension Ignorio {
    struct Search: AsyncParsableCommand {
        static let configuration: CommandConfiguration = .init(
            abstract: "Search supported types by query"
        )

        @Argument(help: "Search for TYPE in available types at gitignore.io")
        var type: String
        var service: GitIgnoreIOService = .live()

        func run() async throws {
            let matches = try await service.search(type)

            if matches.count > 0 {
                print(matches.joined(separator: "\n"))
            } else {
                print("No match for `\(type)`.")
            }
        }

        enum CodingKeys: String, CodingKey {
            case type
        }
    }
}