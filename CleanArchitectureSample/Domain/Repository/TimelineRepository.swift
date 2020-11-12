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
    public func getTwitterTimelines(_ account: ACAccountPlus) -> Observable<[TimelineEntity]> {
        return .just([])
    }
    
    public func getTwitterUserTimelines(_ account: ACAccountPlus, screenName: String) -> Observable<[TimelineEntity]> {
        return .just([])
    }
}
