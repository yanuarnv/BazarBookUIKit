import UIKit

class MainTabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstVC = HomeViewController()
        let secondVC = CategoryViewController()
        
        firstVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: nil)
        secondVC.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "list.bullet"), selectedImage: nil)
        
        viewControllers = [firstVC, secondVC]
    }
}

#Preview{
    MainTabbarController()
}
