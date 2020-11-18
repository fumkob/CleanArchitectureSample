//
//  OAuthClient.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/13.
//

import Foundation
import OAuthSwift
import RxSwift
import ObjectMapper

protocol OAuthClient {
    func getOAuthToken() -> Single<[String: String]>
    func getAPIRequestResult(of: URL, account: ACAccountPlus) -> Observable<[TimelineEntity]>
}

public class OAuthClientImpl: OAuthClient {
    private let oauthswift: OAuth1Swift = OAuth1Swift(
        consumerKey: "aiSbp28ZF965SD1bQwDP4YHG2",
        consumerSecret: "ifXPVrate6VNPgUtIhimd5qOEmF0gd2hJYfobSFlFQ7GHCNAUn",
        requestTokenUrl: "https://api.twitter.com/oauth/request_token",
        authorizeUrl: "https://api.twitter.com/oauth/authorize",
        accessTokenUrl: "https://api.twitter.com/oauth/access_token"
    )
    private var token: [String: String] = [
        "token": "",
        "tokenSecret": ""
    ]
    
    public func getOAuthToken() -> Single<[String: String]> {
        return .create {observer in
            self.oauthswift.authorize(
            withCallbackURL: URL(string: "twitterlander://")!) { result in
                switch result {
                case .success(let (credential, _, _)):
                    self.token["token"] = credential.oauthToken
                    self.token["tokenSecret"] = credential.oauthTokenSecret
                    observer(.success(self.token))
                case .failure:
                    observer(.failure(APIError.oauthError))
                }
            }
            return Disposables.create()
        }
    }

    public func getAPIRequestResult(of url: URL, account: ACAccountPlus) -> Observable<[TimelineEntity]> {
        return .create {[unowned self] observer in
            self.oauthswift.client.credential.oauthToken = account.token
            self.oauthswift.client.credential.oauthTokenSecret = account.tokenSecret
            self.oauthswift.client.get(url) {result in
                switch result {
                case .success(let response):
                    let jsonData = try? response.jsonObject()
                    guard let rowTimeline = Mapper<TimelineEntity>().mapArray(JSONObject: jsonData) else {
                        fatalError("Parse Error")
                    }
                    observer.onNext(rowTimeline)
                case .failure:
                    observer.onError(APIError.network)
                }
            }
            
            return Disposables.create()
        }
    }
}
