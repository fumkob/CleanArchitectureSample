//
//  TimelineDataStore.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/12.
//

import Foundation
import RxSwift

public protocol TimelineDataStore {
    func getHomeTimelines(_ account: ACAccountPlus) -> Observable<[TimelineEntity]>
    func getUserTimelines(_ account: ACAccountPlus, screenName: String) -> Observable<[TimelineEntity]>
}
