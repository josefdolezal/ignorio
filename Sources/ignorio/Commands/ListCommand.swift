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
    try commonResult { $0.list() }
}
