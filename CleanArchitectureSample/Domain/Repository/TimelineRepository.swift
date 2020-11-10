//
//  TimelineRepository.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/08.
//

import Foundation
import RxSwift
import Accounts

protocol TimelineRepository {
    func getTwitterTimelines(_ account: ACAccount) -> Observable<TimelinesModel>
    func getTwitterUserTimelines(_ account: ACAccount, screenName: String) -> Observable<TimelinesModel>
}

public class TimelineRepositoryImpl: TimelineRepository {
    public func getTwitterTimelines(_ account: ACAccount) -> Observable<TimelinesModel> {
        return .just(TimelinesModel())
    }
    
    public func getTwitterUserTimelines(_ account: ACAccount, screenName: String) -> Observable<TimelinesModel> {
        return .just(TimelinesModel())
    }
}
