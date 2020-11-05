//
//  RootViewController.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/05.
//

import UIKit

final class RootViewController: UIViewController {
    private lazy var timelineNavigationController: UINavigationController = {
        let vc = StoryboardScene.Timeline.navigation.instantiate()
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSetup()
    }
    private func viewSetup() {
        addChild(timelineNavigationController, toContainerView: view)
    }
}
