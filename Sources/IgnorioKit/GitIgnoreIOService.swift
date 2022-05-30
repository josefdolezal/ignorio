import Foundation

public struct GitIgnoreIOService {
    public var search: (_ query: String) async throws -> [String]
    public var list: () async throws -> [String]
    public var generate: (_ types: [String]) async throws -> String

    public static func live(client: HttpClient = .live) -> GitIgnoreIOService {
        return .init(
            search: { query in
                let data = try await client.get(URL(string: "https://www.gitignore.io/api/list")!)
                let response = String(data: data, encoding: .utf8)!
                let all = response.components(separatedBy: "\n")
                    .map { $0.components(separatedBy: ",") }
                    .flatMap { $0 }

                return all.filter { $0.lowercased().contains(query.lowercased()) }
            },

            list: {
                let data = try await client.get(URL(string: "https://www.gitignore.io/api/list")!)

                let response = String(data: data, encoding: .utf8)!
                let all = response.components(separatedBy: "\n")
                    .map { $0.components(separatedBy: ",") }
                    .flatMap { $0 }

                return all
            },

            generate: { types in
                let query = types.joined(separator: ",")
                let data = try await client.get(URL(string: "https://www.gitignore.io/api/\(query)")!)
                let response = String(data: data, encoding: .utf8)!

                return response
            }
        )
    }
}