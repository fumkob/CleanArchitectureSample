//
//  TimelineRepository.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/08.
//

import Foundation
import RxSwift

protocol TimelineRepository {
    func getTwitterTimelines(_ account: ACAccountPlus) -> Observable<TimelinesModel>
    func getTwitterUserTimelines(_ account: ACAccountPlus, screenName: String) -> Observable<TimelinesModel>
}

public class TimelineRepositoryImpl: TimelineRepository {
    public func getTwitterTimelines(_ account: ACAccountPlus) -> Observable<TimelinesModel> {
        return .just(TimelinesModel())
    }
    
    public func getTwitterUserTimelines(_ account: ACAccountPlus, screenName: String) -> Observable<TimelinesModel> {
        return .just(TimelinesModel())
    }
}
