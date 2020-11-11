//
//  TimelineModel.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/08.
//

import Foundation

public struct TimelinesModel {
    var timelines: [TimelineModel] = []
}

public struct TimelineModel: TimelineViewModel, UserViewModel {
    let name: String
    let screenName: String
    let profileUrl: String
    let tweet: String
    let profileBackgroundUrl: String
    let userDescription: String
    
    init() {
        name = ""
        screenName = ""
        profileUrl = ""
        tweet = ""
        profileBackgroundUrl = ""
        userDescription = ""
    }
}
