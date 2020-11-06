//
//  UIViewController+Extensions.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/05.
//

import UIKit

extension UIViewController {
    func addChild(_ vc: UIViewController, toContainerView containerView: UIView) {
        addChild(vc)
        containerView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
}
