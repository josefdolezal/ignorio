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

let listCommnad = command {
    let ignorio = IgnorioKit()

    let result = ignorio.list()

    switch result {
    case let .success(list): print(list)
    case let .failure(error): throw error
    }
}
