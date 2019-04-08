//
//  GitignoreioProvider.swift
//  ignorio
//
//  Created by Josef Dolezal on 31/05/2017.
//
//

import Foundation

/// Main logic for files retrieving
struct GitignoreioProvider {
    /// Shortcut for result type
    typealias RequestResult = Result<String, IgnorioKitError>

    /// Public accessible initializer
    init() { }

    /// Requests .gitignore file content from API. The request is synchronous.
    ///
    /// - Parameter types: List of types used to generate .gitignore
    /// - Returns: Content of .gitignore file content on success, failure otherwise
    func create(types: [String]) -> RequestResult {
        let result = synchronousRequest(GitignoreioAPI.create(types: types).request)

        return result
    }

    /// Requests list of supported types for .gitignore file. The request is synchronous.
    ///
    /// - Returns: String representation of supported types on success, failure otherwise
    func list() -> RequestResult {
        let result = synchronousRequest(GitignoreioAPI.list.request)

        return result
    }

    /// Creates synchronuous URL request call
    ///
    /// - Parameter request: Request which will be called
    /// - Returns: Network request result
    func synchronousRequest(_ request: URLRequest) -> RequestResult {
        // Semaphore which makes the call synchronous
        let semaphore = DispatchSemaphore(value: 0)
        // Default result value
        var result = RequestResult.failure(.requestTimeout)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Create failure result with underlying error if occured
            if let error = error {
                result = .failure(IgnorioKitError.networkError(underlying: error))

                semaphore.signal()
                return
            }

            // Unwrap response text or create failure result
            guard let data = data, let responseText = String(data: data, encoding: .utf8) else {
                result = .failure(IgnorioKitError.unexpectedResponseFormat)

                semaphore.signal()
                return
            }

            // Create success result
            result = .success(responseText)
            semaphore.signal()
        }

        task.resume()
        // Wait for request to complete (on the same thread)
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        
        return result
    }
}
