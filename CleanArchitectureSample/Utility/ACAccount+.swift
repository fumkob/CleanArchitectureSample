//
//  ACAccount+.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/11.
//

import Foundation
import Accounts

public struct ACAccountsPlus: Codable {
    public var accounts: [ACAccountPlus] = []
}

public struct ACAccountPlus: Codable {
    public var username: String = ""
    public var identifier: String = ""
    public var token: String = ""
    public var tokenSecret: String = ""
}

extension ACAccountPlus {
    init (username: String, token: String, tokenSecret: String) {
        identifier = randomString(length: 16)
        self.username = username
        self.token = token
        self.tokenSecret = tokenSecret
    }
}

// MARK: - private
extension ACAccountPlus {
    private func randomString(length: Int) -> String {
        
        let letters: NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)

        var randomString = ""

        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }

        return randomString
    }
}
