import UIKit

class MainTabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = HomeViewController()
        let secondVC = CategoryViewController()
        
        let homeNav = UINavigationController(rootViewController: firstVC)
        let categoryNav = UINavigationController(rootViewController: secondVC)
        
        homeNav.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(systemName: "newspaper"), selectedImage: nil)
        categoryNav.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "list.bullet"), selectedImage: nil)
        viewControllers = [homeNav, categoryNav]
    }
}

#Preview{
    MainTabbarController()
}
