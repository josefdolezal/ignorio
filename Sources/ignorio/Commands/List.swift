import ArgumentParser
import IgnorioKit

extension Ignorio {
    struct List: AsyncParsableCommand {
        static var configuration: CommandConfiguration = .init(
            abstract: "List all supported types by gitignore.io"
        )

        func run() async throws {
            let alphabeticList = try listSupportedTypes()
            let list = alphabeticList
                .map { $0.joined(separator: ",") }
                .joined(separator: "\n")

            print(list)
        }
    }
}