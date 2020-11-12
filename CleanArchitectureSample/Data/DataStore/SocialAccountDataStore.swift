//
//  SocialAccountDataStore.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/12.
//

import Foundation
import RxSwift

public protocol SocialAccountDataStore {
    func getTwitterAccounts() -> Observable<[ACAccountPlus]>
    func getNewTwitterAccount() -> Observable<Void>
}

public class SocialAccountDataStoreImpl: SocialAccountDataStore {
    public func getTwitterAccounts() -> Observable<[ACAccountPlus]> {
        return .just([])
    }
    
    public func getNewTwitterAccount() -> Observable<Void> {
        return .just(())
    }
}
