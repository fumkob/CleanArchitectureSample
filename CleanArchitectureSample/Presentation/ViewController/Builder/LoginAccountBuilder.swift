//
//  LoginAccountBuilder.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/07.
//

import UIKit

struct LoginAccountBuilder {
    func build() -> UIViewController {
        let useCase = LoginAccountUseCaseImpl(
            loginAccountRepository: LoginAccountRepositoryImpl(),
            socialAccountRepository: SocialAccountRepositoryImpl(dataStore: SocialAccountDataStoreImpl())
        )
        let wireframe = LoginAccountWireframeImpl()
        let vc = StoryboardScene.LoginAccount.loginAccount.instantiate()
        
        let presenter = LoginAccountPresenterImpl(useCase: useCase, viewInput: vc, wireframe: wireframe, observer: SharedObserver.instance)
        wireframe.vc = vc
        vc.inject(presenter: presenter)
        
        return vc
    }
}
