//
//  TimelineBuilder.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/07.
//

import UIKit

struct HomeTimelineBuilder {
    func build() -> UIViewController {
        let useCase = TimelineUseCaseImpl(
            loginAccountRepository: LoginAccountRepositoryImpl(dataStore: LoginAccountDataStoreImpl()),
            socialAccountRepository: SocialAccountRepositoryImpl(dataStore: SocialAccountDataStoreImpl()),
            timelineRepository: TimelineRepositoryImpl(dataStore: TimelineDataStoreImpl()))
        let wireframe = HomeTimelineWireframeImpl()
        let vc = StoryboardScene.Timeline.timeline.instantiate()
        
        let presenter = HomeTimelinePresenterImpl(useCase: useCase, viewInput: vc, wireframe: wireframe, observer: SharedObserver.instance)
        wireframe.vc = vc
        vc.inject(presenter: presenter)
        
        return vc
    }
}

struct UserTimelineBuilder {
    private var screenName: String
    
    init(screenName: String) {
        self.screenName = screenName
    }
    
    func build() -> UIViewController {
        let useCase = TimelineUseCaseImpl(
            loginAccountRepository: LoginAccountRepositoryImpl(dataStore: LoginAccountDataStoreImpl()),
            socialAccountRepository: SocialAccountRepositoryImpl(dataStore: SocialAccountDataStoreImpl()),
            timelineRepository: TimelineRepositoryImpl(dataStore: TimelineDataStoreImpl()))
        let wireframe = UserTimelineWireframeImpl()
        let vc = StoryboardScene.Timeline.timeline.instantiate()
        
        let presenter = UserTimelinePresenterImpl(useCase: useCase, viewInput: vc, wireframe: wireframe, screenName: screenName)
        wireframe.vc = vc
        vc.inject(presenter: presenter)
        
        return vc
    }
}
