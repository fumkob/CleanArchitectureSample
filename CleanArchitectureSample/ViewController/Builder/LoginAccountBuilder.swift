//
//  LoginAccountBuilder.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/07.
//

import UIKit

struct LoginAccountBuilder {
    func build() -> UIViewController {
        let wireframe = LoginAccountWireframeImpl()
        let vc = StoryboardScene.LoginAccount.loginAccount.instantiate()
        
        let presenter = LoginAccountPresenterImpl(viewInput: vc, wireframe: wireframe, observer: SharedObserver.instance)
        wireframe.vc = vc
        vc.inject(presenter: presenter)
        
        return vc
    }
}
