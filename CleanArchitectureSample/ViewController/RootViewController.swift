//
//  RootViewController.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/05.
//

import UIKit

final class RootViewController: UIViewController {
    private lazy var homeTimelineViewController: TimelineViewController = {
        let vc = StoryboardScene.Timeline.timeline.instantiate()
        vc.showLogin = { [unowned self] in
            self.presentLoginAccountViewController()
        }
        return vc
    }()
    private lazy var loginAccountViewController: LoginAccountViewController = {
        let vc = StoryboardScene.LoginAccount.loginAccount.instantiate()
        vc.closeWindow = {[unowned self] in
            self.dismiss(animated: true, completion: nil)
        }
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSetup()
    }
    private func viewSetup() {
        let homeTimelineNavigationController = UINavigationController(rootViewController: homeTimelineViewController)
        addChild(homeTimelineNavigationController, toContainerView: view)
    }
    
    private func presentLoginAccountViewController() {
        let loginAccountNavigationController = UINavigationController(rootViewController: loginAccountViewController)
        loginAccountNavigationController.modalPresentationStyle = .fullScreen
        present(loginAccountNavigationController, animated: true, completion: nil)
    }
}
