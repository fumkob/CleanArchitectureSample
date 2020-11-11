//
//  RootViewController.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/05.
//

import UIKit

final class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialViewSetup()
    }
    private func initialViewSetup() {
        let homeTimelineViewController = HomeTimelineBuilder().build()
        let homeTimelineNavigationController = UINavigationController(rootViewController: homeTimelineViewController)
        addChild(homeTimelineNavigationController, toContainerView: view)
    }
}
