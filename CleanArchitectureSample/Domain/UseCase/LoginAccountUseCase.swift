//
//  LoginAccountUseCase.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/11.
//

import Foundation
import RxSwift

// MARK: - Interface
protocol LoginAccountUseCase {
    func loadAccounts() -> Observable<RegisteredAccountsModel>
    func selectAccount(_ account: RegisteredAccountModel) -> Observable<Void>
    func addAccount(name: String) -> Observable<Void>
}

// MARK: - Implementation
struct LoginAccountUseCaseImpl: LoginAccountUseCase {
    private let loginAccountRepository: LoginAccountRepository
    private let socialAccountRepository: SocialAccountRepository
    
    var acAccounts: [ACAccountPlus] = []
    
    public init(loginAccountRepository: LoginAccountRepository, socialAccountRepository: SocialAccountRepository) {
        self.loginAccountRepository = loginAccountRepository
        self.socialAccountRepository = socialAccountRepository
    }
    
    func loadAccounts() -> Observable<RegisteredAccountsModel> {
        let login = loginAccountRepository.getSelectedTwitterAccount()
        let accounts = socialAccountRepository.getTwitterAccounts()
        
        return Observable.combineLatest(accounts, login) { ($0, $1) }
            .flatMap { (accounts, identifier) -> Observable<RegisteredAccountsModel> in
                return Observable.just((accounts, identifier))
                    .map(translator: RegisteredAccountTranslator())
            }
    }
    
    func selectAccount(_ account: RegisteredAccountModel) -> Observable<Void> {
        return socialAccountRepository.getTwitterAccounts()
            .flatMap { accounts -> Observable<Void> in
                guard let acAccount = accounts.filter({ $0.identifier == account.identifier}).first else {
                    return Observable.error(APIError.generic)
                }
                
            return self.loginAccountRepository.updateSelectedTwitterAccount(acAccount)
            }
    }
    
    func addAccount(name: String) -> Observable<Void> {
        return socialAccountRepository.getNewTwitterAccount(name: name)
    }
    
}
