//
//  Translator.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/11.
//

import Foundation
import RxSwift

public protocol Translator {
    associatedtype Input
    associatedtype Output
    
    func translate(_: Input) throws -> Output
}

// MARK: - Extensions

public extension ObservableType {
    func map<T: Translator>(translator: T) -> Observable<T.Output> where Self.Element == T.Input {
        return map { try translator.translate($0) }
    }
}

extension Collection {
    public func map<T: Translator>(translator: T) throws -> [T.Output] where Self.Iterator.Element == T.Input {
        return try map { try translator.translate($0) }
    }
}
