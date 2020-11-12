//
//  LoginAccountRepository.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/08.
//

import Foundation
import RxSwift

protocol LoginAccountRepository {
    func getSelectedTwitterAccount() -> Observable<String?>
    func updateSelectedTwitterAccount(_ account: ACAccountPlus) -> Observable<Void>
    func deleteTwitterAccount() -> Observable<Void>
}

public class LoginAccountRepositoryImpl: LoginAccountRepository {
    private let dataStore: LoginAccountDataStore
    
    public init(dataStore: LoginAccountDataStore) {
        self.dataStore = dataStore
    }
    
    public func getSelectedTwitterAccount() -> Observable<String?> {
        return dataStore.getSelectedTwitterAccountId()
    }
    
    public func updateSelectedTwitterAccount(_ account: ACAccountPlus) -> Observable<Void> {
        return dataStore.updateSelectedTwitterAccountId(account)
    }
    
    public func deleteTwitterAccount() -> Observable<Void> {
        return dataStore.deleteSelectedTwitterAccountId()
    }
}
