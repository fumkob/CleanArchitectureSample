//
//  SocialAccountRepository.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/08.
//

import Foundation
import RxSwift

protocol SocialAccountRepository {
    func getTwitterAccounts() -> Observable<[ACAccountPlus]>
    func getNewTwitterAccount() -> Observable<Void>
}

public class SocialAccountRepositoryImpl: SocialAccountRepository {
    private let dataStore: SocialAccountDataStore
    
    public init(dataStore: SocialAccountDataStore) {
        self.dataStore = dataStore
    }
    
    public func getTwitterAccounts() -> Observable<[ACAccountPlus]> {
        return dataStore.getTwitterAccounts()
    }
    
    public func getNewTwitterAccount() -> Observable<Void> {
        return dataStore.getNewTwitterAccount()
    }
}
