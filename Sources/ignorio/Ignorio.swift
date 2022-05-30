import ArgumentParser

@main
struct Ignorio: AsyncParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Command line interface for gitignore.io",
        version: "0.2.0",
        subcommands: [
            Generate.self,
            Search.self,
            List.self,
        ]
    )
}
