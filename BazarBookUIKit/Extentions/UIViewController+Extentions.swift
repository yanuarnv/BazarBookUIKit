import UIKit

// navigation Extentions
extension UIViewController {
    enum Navigation {
        //onboarding
        case onboardingView
        //home
        case homeView
        // auth
        case signUpView
        case signInView
        case forgotPasswordView
    }
    
    func push ( from: UIViewController,to navigation: Navigation,replace:Bool = false){
        var viewController: UIViewController?
        switch navigation {
        case .onboardingView:
            viewController =  OnboardingViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        case .homeView:
            viewController =  HomeViewController()
        case .signUpView:
            viewController =  SignUpViewController()
        case .signInView:
            viewController =  SignInViewController()
        case .forgotPasswordView:
            viewController = ForgotPasswordViewController()
        }
        
        if let vc = viewController {
            if replace{
                from.navigationController?.setViewControllers([vc], animated: true)
            }else{
                from.navigationController?.pushViewController(vc, animated: true)
            }
        }else{
            debugPrint("❌ NavigationController not found, presenting \(String(describing: viewController)) instead.")
        }
    }
    
    
    static func initializeNavigationController() -> UINavigationController {
        let initialVc = OnboardingViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        let navController = UINavigationController(rootViewController: initialVc)
        return navController
    }
}
