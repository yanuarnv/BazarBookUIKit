//
//  SceneDelegate.swift
//  AppStoreCompositionalLayout
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        AppContainer.configuredDependencyInjection()
        let window = UIWindow(windowScene: windowScene)
        let rootVC = MainTabbarController()
        
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
        self.window = window
    }
}

