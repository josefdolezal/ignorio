//
//  CommonResult.swift
//  ignorio
//
//  Created by Josef Dolezal on 31/05/2017.
//
//

import Result
import IgnorioKit

/// Common Ignorio result handler, used as simple wrapper for requests results.
///
/// - Parameter resultFactory: Result factory
/// - Returns: Request result on success
/// - Throws: Rethrows IgnorioKitError
func commonResult(resultFactory: (IgnorioKit) -> IgnorioKit.RequestResult) throws -> String {
    let ignorio = IgnorioKit()

    let result = resultFactory(ignorio)

    switch result {
    case let .success(data): return data
    case let .failure(error): throw error
    }
}
