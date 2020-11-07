//
//  SharedObserver.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/07.
//

import RxSwift

class SharedObserver {
    static let instance: SharedObserver = SharedObserver()
    private let selectPerson: PublishSubject<Void> = PublishSubject()
}

public protocol SelectPersonObserver {
    var selectPersonObserver: PublishSubject<Void> { get }
}

extension SharedObserver: SelectPersonObserver {
    public var selectPersonObserver: PublishSubject<Void> {
        return selectPerson
    }
}
