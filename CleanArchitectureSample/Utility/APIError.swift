//
//  APIError.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/09.
//

import Foundation

public enum APIError: Error {
    case noError
    case network
    case notAuthorized
    case generic
    
    var isError: Bool {
        return self != .noError
    }
}
