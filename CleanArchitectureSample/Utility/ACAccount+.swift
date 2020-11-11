//
//  ACAccount+.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/11.
//

import Foundation

public struct ACAccountPlus {
    public var username: String
    public var identifier: String
}

extension ACAccountPlus {
    init () {
        username = ""
        identifier = ""
    }
}
