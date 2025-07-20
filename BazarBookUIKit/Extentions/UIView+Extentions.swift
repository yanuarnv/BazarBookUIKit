import UIKit

// navigation Extentions
extension UIViewController {
    
    enum Navigation {
        //onboarding
        case onboardingView
        //home
        case homeView
        case mainView
        // auth
        case signUpView
        case signInView
        case forgotPasswordView
    }
    
    func push ( from: UIViewController,to navigation: Navigation,replace:Bool = false){
        let targetVC: UIViewController
        switch navigation {
        case .onboardingView:
            targetVC =  OnboardingViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        case .homeView:
            targetVC =  HomeViewController()
        case .mainView:
            targetVC = MainTabbarController()
        case .signUpView:
            targetVC =  SignUpViewController()
        case .signInView:
            targetVC =  SignInViewController()
        case .forgotPasswordView:
            targetVC = ForgotPasswordViewController()
        }
        guard let navigationController = from.navigationController else {
            fatalError("\(from) navigatonController not found")
        }
        if replace {
            navigationController.setViewControllers([targetVC], animated: true)
        } else {
            navigationController.pushViewController(targetVC, animated: true)
        }
        
        
    }
    
    func forPreview() ->UIViewController{
        AppContainer.configuredDependencyInjection()
        return self
    }
    
}
