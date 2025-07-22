import UIKit

class MainTabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = HomeViewController()
        let secondVC = CategoryViewController()
        let thridVC = SearchListViewController()
        
        let homeNav = UINavigationController(rootViewController: firstVC)
        let categoryNav = UINavigationController(rootViewController: secondVC)
        let seachNav = UINavigationController(rootViewController: thridVC)
        
        homeNav.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(systemName: "newspaper"), selectedImage: nil)
        categoryNav.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "list.bullet"), selectedImage: nil)
        seachNav.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: nil)
        viewControllers = [homeNav, categoryNav, seachNav]
    }
}

#Preview{
    MainTabbarController()
}
