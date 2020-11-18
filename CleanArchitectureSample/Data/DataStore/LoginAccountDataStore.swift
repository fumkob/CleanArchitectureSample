//
//  LoginAccountDataStore.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/12.
//

import Foundation
import RxSwift

public protocol LoginAccountDataStore {
    func getSelectedTwitterAccountId() -> Observable<String?>
    func updateSelectedTwitterAccountId(_ account: ACAccountPlus) -> Observable<Void>
    func deleteSelectedTwitterAccountId() -> Observable<Void>
}

public class LoginAccountDataStoreImpl: LoginAccountDataStore {
    let loginUserId: String = "_LOGIN_USER_ID"
    public func getSelectedTwitterAccountId() -> Observable<String?> {
        let identifier = UserDefaults.standard.string(forKey: loginUserId)
        return .just(identifier)
    }
    
    public func updateSelectedTwitterAccountId(_ account: ACAccountPlus) -> Observable<Void> {
        UserDefaults.standard.set(account.identifier, forKey: loginUserId)
        return .just(())
    }
    
    public func deleteSelectedTwitterAccountId() -> Observable<Void> {
        UserDefaults.standard.removeObject(forKey: loginUserId)
        return .just(())
    }
}
