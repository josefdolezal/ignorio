import ArgumentParser
import IgnorioKit

extension Ignorio {
    struct Search: AsyncParsableCommand {
        static let configuration: CommandConfiguration = .init(
            abstract: "Search supported types by query"
        )

        @Argument(help: "Search for TYPE in available types at gitignore.io")
        var type: String

        func run() async throws {
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