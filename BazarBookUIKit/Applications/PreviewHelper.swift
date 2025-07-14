import UIKit

struct PreviewHelper {
    static func configureForPreview() {
        AppContainer.configureForPreview()
    }
    
    static func homeViewController() -> HomeViewController {
        configureForPreview()
        return HomeViewController()
    }
    
    static func categoryViewController() -> CategoryViewController {
        configureForPreview()
        return CategoryViewController()
    }
    
    static func mainTabbarController() -> MainTabbarController {
        configureForPreview()
        return MainTabbarController()
    }
}
