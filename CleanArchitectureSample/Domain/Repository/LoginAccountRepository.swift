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
    func getNewTwitterAccount() -> Observable<Void>
}

public class LoginAccountRepositoryImpl: LoginAccountRepository {
    public func getSelectedTwitterAccount() -> Observable<String?> {
        return .just("some")
    }
    
    public func updateSelectedTwitterAccount(_ account: ACAccountPlus) -> Observable<Void> {
        return .just(())
    }
    
    public func deleteTwitterAccount() -> Observable<Void> {
        return .just(())
    }
    
    public func getNewTwitterAccount() -> Observable<Void> {
        return .just(())
    }
}
