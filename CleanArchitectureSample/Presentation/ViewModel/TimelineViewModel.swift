//
//  TimelineViewModel.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/08.
//

import Foundation

protocol TimelineViewModel {
    var name: String { get }
    var screenName: String { get }
    var profileUrl: String { get }
    var tweet: String { get }
}

protocol UserViewModel {
    var name: String { get }
    var screenName: String { get }
    var profileUrl: String { get }
    var profileBackgroundUrl: String { get }
    var userDescription: String { get }
}
