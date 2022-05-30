import Foundation

public struct HttpClient {
    public var get: (_ url: URL) async throws -> Data

    public static let live: HttpClient = .init(
        get: { url in
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        }
    )
}
