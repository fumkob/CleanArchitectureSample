//
//  TimelineRepository.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/08.
//

import Foundation
import RxSwift

protocol TimelineRepository {
    func getTwitterTimelines(_ account: ACAccountPlus) -> Observable<[TimelineEntity]>
    func getTwitterUserTimelines(_ account: ACAccountPlus, screenName: String) -> Observable<[TimelineEntity]>
}

public class TimelineRepositoryImpl: TimelineRepository {
    private let dataStore: TimelineDataStore
    
    public init(dataStore: TimelineDataStore) {
        self.dataStore = dataStore
    }
    
    public func getTwitterTimelines(_ account: ACAccountPlus) -> Observable<[TimelineEntity]> {
        return dataStore.getHomeTimelines(account)
    }
    
    public func getTwitterUserTimelines(_ account: ACAccountPlus, screenName: String) -> Observable<[TimelineEntity]> {
        return dataStore.getUserTimelines(account, screenName: screenName)
    }
}
