//
//  TimelineUseCase.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/08.
//

import Foundation
import RxSwift

// MARK: - Interface
protocol TimelineUseCase {
    func loadTimelines() -> Observable<TimelinesModel>
    func loadTimelines(screenName: String) -> Observable<TimelinesModel>
}

// MARK: - Implementation
struct TimelineUseCaseImpl: TimelineUseCase {
    
    private let loginAccountRepository: LoginAccountRepository
    private let socialAccountRepository: SocialAccountRepository
    private let timelineRepository: TimelineRepository
    
    public init(loginAccountRepository: LoginAccountRepository, socialAccountRepository: SocialAccountRepository, timelineRepository: TimelineRepository) {
        self.loginAccountRepository = loginAccountRepository
        self.socialAccountRepository = socialAccountRepository
        self.timelineRepository = timelineRepository
    }
    
    func loadTimelines() -> Observable<TimelinesModel> {
        let login = loginAccountRepository.getSelectedTwitterAccount()
        let accounts = socialAccountRepository.getTwitterAccounts()
        
        return Observable.combineLatest(login, accounts) { ($0, $1)}
//            .do{print($0)}
            .flatMap { (identifier, accounts) -> Observable<TimelinesModel> in
                guard let identifier = identifier,
                      let selectedAccount = accounts.filter({$0.identifier.isEqual(to: identifier)}).first else {
                    return Observable.error(APIError.notAuthorized)
                }
                return timelineRepository.getTwitterTimelines(selectedAccount)
            }
    }
    
    func loadTimelines(screenName: String) -> Observable<TimelinesModel> {
        let login = loginAccountRepository.getSelectedTwitterAccount()
        let accounts = socialAccountRepository.getTwitterAccounts()
        
        return Observable.combineLatest(login, accounts) { ($0, $1)}
            .flatMap { (identifier, accounts) -> Observable<TimelinesModel> in
                guard let identifier = identifier,
                      let selectedAccount = accounts.filter({$0.identifier.isEqual(to: identifier)}).first else {
                    return Observable.error(APIError.notAuthorized)
                }
                return timelineRepository.getTwitterUserTimelines(selectedAccount, screenName: screenName)
            }
    }
    
}
