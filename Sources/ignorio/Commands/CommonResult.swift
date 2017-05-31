//
//  CommonResult.swift
//  ignorio
//
//  Created by Josef Dolezal on 31/05/2017.
//
//

import Result
import IgnorioKit

/// Common Ignorio result handler
///
/// - Parameter resultFactory: Result factory
/// - Throws: Rethrows IgnorioKitError
func commonResult(resultFactory: (IgnorioKit) -> IgnorioKit.RequestResult) throws {
    let ignorio = IgnorioKit()

    let result = resultFactory(ignorio)

    switch result {
    case let .success(data): print(data)
    case let .failure(error): throw error
    }
}
