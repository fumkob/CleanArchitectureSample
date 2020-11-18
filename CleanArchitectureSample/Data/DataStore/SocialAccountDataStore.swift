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
    func getNewTwitterAccount(name: String) -> Observable<Void>
}

public class SocialAccountDataStoreImpl: SocialAccountDataStore {
    private var client: OAuthClient
    private var disposeBag = DisposeBag()
    
    init(client: OAuthClient) {
        self.client = client
    }
    
    public func getTwitterAccounts() -> Observable<[ACAccountPlus]> {
        UserDefaults.standard.register(defaults: ["accounts": Data()])
        guard let accountsData = UserDefaults.standard.data(forKey: "accounts") else {
            fatalError("Loading error of accounts")
        }
        do {
            let accounts = try JSONDecoder().decode(ACAccountsPlus.self, from: accountsData)
            return .just(accounts.accounts)
        } catch {
            return .just([])
        }
    }
    
    public func getNewTwitterAccount(name: String) -> Observable<Void> {
        return .create { [unowned self] observer in
            self.client.getOAuthToken()
            .subscribe(onSuccess: { [unowned self] tokenInfo in
                var accounts = ACAccountsPlus()
                guard let token = tokenInfo["token"], let tokenSecret = tokenInfo["tokenSecret"] else {
                    fatalError("token error")
                }
                let account = ACAccountPlus(
                    username: name,
                    token: token,
                    tokenSecret: tokenSecret)

                self.getTwitterAccounts()
                    .subscribe(onNext: { savedAccounts in
                        accounts.accounts = savedAccounts
                    }, onError: { error in
                        print(error)
                    })
                    .disposed(by: self.disposeBag)

                accounts.accounts.append(account)
                self.saveTwitterAccount(accounts: accounts)
                observer.onNext(())
            }, onFailure: { error in
                guard let error = error as? APIError else { fatalError("OAuthToken Error") }
                print(error)
                observer.onNext(())
            })
                .disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
}

// MARK: - Private
extension SocialAccountDataStoreImpl {
    private func saveTwitterAccount(accounts: ACAccountsPlus) {
        do {
            let accountsData = try JSONEncoder().encode(accounts)
            UserDefaults.standard.set(accountsData, forKey: "accounts")
        } catch {
            fatalError("Save error of accounts")
        }
    }
}
