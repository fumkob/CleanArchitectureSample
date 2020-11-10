//
//  SocialAccountRepository.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/08.
//

import Foundation
import RxSwift
import Accounts

protocol SocialAccountRepository {
    func getTwitterAccounts() -> Observable<[ACAccount]>
}

public class SocialAccountRepositoryImpl: SocialAccountRepository {
    public func getTwitterAccounts() -> Observable<[ACAccount]> {
        return .just([ACAccount()])
    }
}
