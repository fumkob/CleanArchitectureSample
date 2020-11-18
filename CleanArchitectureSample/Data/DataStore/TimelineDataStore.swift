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

public class TimelineDataStoreImpl: TimelineDataStore {
    private let client: OAuthClient
    
    init(client: OAuthClient) {
        self.client = client
    }
    
    public func getHomeTimelines(_ account: ACAccountPlus) -> Observable<[TimelineEntity]> {
        guard let url = URL(string: "https://api.twitter.com/1.1/statuses/home_timeline.json") else {
            fatalError("invalid url")
        }
        return client.getAPIRequestResult(of: url, account: account)
        
    }
    public func getUserTimelines(_ account: ACAccountPlus, screenName: String) -> Observable<[TimelineEntity]> {
        return .just([])
    }
}
