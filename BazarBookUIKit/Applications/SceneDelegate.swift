//
//  SceneDelegate.swift
//  AppStoreCompositionalLayout
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        configuredDependencyInjection()
        let window = UIWindow(windowScene: windowScene)
        let rootVC = initializeNavigationController()
        
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
        self.window = window
    }
}

extension SceneDelegate{
    
    func initializeNavigationController() -> UINavigationController {
        //        let initialVC = OnboardingViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        let initialVC = MainTabbarController()
        return UINavigationController(rootViewController: initialVC)
    }
    
    func configuredDependencyInjection() {
        AppContainer.shared.register(type: BookApiService.self, component: BookApiServiceImpl())
        AppContainer.shared.register(type: HomeViewModel.self, component: HomeViewModel(service: AppContainer.shared.resolve(type: BookApiService.self)!))
    }
}

