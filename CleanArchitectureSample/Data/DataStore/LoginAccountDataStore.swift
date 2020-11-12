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
    public func getSelectedTwitterAccountId() -> Observable<String?> {
        return .just("")
    }
    
    public func updateSelectedTwitterAccountId(_ account: ACAccountPlus) -> Observable<Void> {
        return .just(())
    }
    
    public func deleteSelectedTwitterAccountId() -> Observable<Void> {
        return .just(())
    }
}
