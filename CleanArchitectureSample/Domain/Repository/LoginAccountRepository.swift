//
//  LoginAccountRepository.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/08.
//

import Foundation
import RxSwift
import Accounts

protocol LoginAccountRepository {
    func getSelectedTwitterAccount() -> Observable<String?>
    func updateSelectedTwitterAccount(_ account: ACAccount) -> Observable<Void>
    func deleteTwitterAccount() -> Observable<Void>
}

public class LoginAccountRepositoryImpl: LoginAccountRepository {
    public func getSelectedTwitterAccount() -> Observable<String?> {
        return .just("")
    }
    
    public func updateSelectedTwitterAccount(_ account: ACAccount) -> Observable<Void> {
        return .just(())
    }
    
    public func deleteTwitterAccount() -> Observable<Void> {
        return .just(())
    }
}
