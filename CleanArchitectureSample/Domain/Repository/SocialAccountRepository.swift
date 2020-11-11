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
}

public class SocialAccountRepositoryImpl: SocialAccountRepository {
    public func getTwitterAccounts() -> Observable<[ACAccountPlus]> {
        return .just([ACAccountPlus()])
    }
}
