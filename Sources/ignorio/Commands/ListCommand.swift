//
//  ListCommand.swift
//  ignorio
//
//  Created by Josef Dolezal on 31/05/2017.
//
//

import Commander
import Result
import IgnorioKit

/// Commands which lists supported types for fetch command
let listCommnad = command {
    let alphabeticList = try listSupportedTypes()
    let list = alphabeticList
        .map { $0.joined(separator: ",") }
        .joined(separator: "\n")

    print(list)
}
