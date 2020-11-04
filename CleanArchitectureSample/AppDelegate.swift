//
//  AppDelegate.swift
//  CleanArchitectureSample
//
//  Created by Fumiaki Kobayashi on 2020/11/04.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //swiftlint:disable line_length
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }

}
