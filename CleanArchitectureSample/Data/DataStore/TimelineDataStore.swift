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
            fatalError("Invalid url")
        }
        return client.getAPIRequestResult(of: url, account: account)
        
    }
    public func getUserTimelines(_ account: ACAccountPlus, screenName: String) -> Observable<[TimelineEntity]> {
        let url = userTimelineUrlGenerator(screenName: screenName)
        return client.getAPIRequestResult(of: url, account: account)
    }
}

// MARK: - Private
extension TimelineDataStoreImpl {
    private func userTimelineUrlGenerator(screenName: String) -> URL {
        let baseUrl = "https://api.twitter.com/1.1/statuses/user_timeline.json"
        let name = "screen_name=" + screenName
        let count = "count=20"
        let replies = "exclude_replies=true"
        let urlString = baseUrl + "?" + name + "&" + count + "&" + replies
        guard let url = URL(string: urlString) else {
            fatalError("Invalid url")
        }
        return url
    }
}
