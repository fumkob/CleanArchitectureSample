//
//  TimelineWireframe.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/07.
//

import UIKit

protocol TimelineWireframe: class {
    var vc: TimelineViewController? { get set }
    
    func showLogin()
    func showUserTimeline(screenName: String)
}

public class HomeTimelineWireframeImpl: TimelineWireframe {
    var vc: TimelineViewController?
    
    func showLogin() {
        let loginAccountViewController = LoginAccountBuilder().build()
        let navigationController = UINavigationController(rootViewController: loginAccountViewController)
        navigationController.modalPresentationStyle = .fullScreen
        vc?.present(navigationController, animated: true, completion: nil)
    }
    
    func showUserTimeline(screenName: String) {
        let nextViewController = UserTimelineBuilder(screenName: screenName).build()
        vc?.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

public class UserTimelineWireframeImpl: TimelineWireframe {
    var vc: TimelineViewController?
    
    func showLogin() {
    }
    
    func showUserTimeline(screenName: String) {
        
    }
}
